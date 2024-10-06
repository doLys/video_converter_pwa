class HomeController < ApplicationController
  def index
    # Logique pour la page d'accueil
  end

  def convert
    if params[:input_file].present?
      input_file = params[:input_file]
      output_format = params[:output_format]

      # Générer un nom de fichier unique pour la sortie
      unique_id = SecureRandom.uuid
      original_filename = File.basename(input_file.original_filename, ".*")
      output_filename = "#{unique_id}_#{original_filename}_converted.#{output_format}"

      output_path = Rails.root.join('tmp', 'video_conversions', output_filename)

      # Commande FFmpeg pour la conversion
      command = "ffmpeg -i #{input_file.path} -c:v libx264 -crf 23 -c:a aac -b:a 128k #{output_path}"

      # Exécuter la commande FFmpeg
      system(command)

      if File.exist?(output_path)
        # Envoyer le fichier converti
        send_file output_path, type: "video/#{output_format}", disposition: 'attachment', filename: output_filename
      else
        render json: { error: "La conversion a échoué" }, status: :unprocessable_entity
      end
    else
      render json: { error: "Aucun fichier n'a été fourni" }, status: :bad_request
    end
  end
end

