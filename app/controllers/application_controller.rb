class ApplicationController < ActionController::Base
  before_action :set_pwa_headers
  before_action :check_for_wap

  helper_method :pwa?

  private

  def set_pwa_headers
    response.headers['Service-Worker-Allowed'] = '/'
    response.headers['X-Frame-Options'] = 'SAMEORIGIN'
    response.headers['X-XSS-Protection'] = '1; mode=block'
    response.headers['X-Content-Type-Options'] = 'nosniff'
  end

  def check_for_wap
    request.variant = :phone if request.user_agent =~ /WAP|Post|OperaMini|Nokia|BlackBerry|UCWEB|Mobile|webOS/i
  end

  def pwa?
    request.user_agent.include?('Mobile') && request.headers['X-Requested-With'] == 'com.video_converter_pwa'
  end

  def handle_video_conversion_error(error)
    logger.error "Erreur de conversion vidéo: #{error.message}"
    render json: { error: "Erreur lors de la conversion de la vidéo" }, status: :unprocessable_entity
  end

  def check_video_format(format)
    allowed_formats = ['mp4', 'webm', 'mov']
    unless allowed_formats.include?(format.downcase)
      render json: { error: "Format vidéo non supporté" }, status: :unprocessable_entity
    end
  end

  def set_video_conversion_options(input_file, output_format)
    case output_format.downcase
    when 'mp4'
      "-i #{input_file} -c:v libx264 -preset fast -crf 22 -c:a aac -b:a 128k"
    when 'webm'
      "-i #{input_file} -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus"
    else
      "-i #{input_file} -c:v libx264 -preset medium -crf 23 -c:a aac -b:a 128k"
    end
  end

  def ensure_tmp_directory
    FileUtils.mkdir_p(Rails.root.join('tmp', 'video_conversions'))
  end

  def clean_old_conversions
    directory = Rails.root.join('tmp', 'video_conversions')
    Dir.glob("#{directory}/*").each do |file|
      File.delete(file) if File.mtime(file) < 1.day.ago
    end
  end
end

