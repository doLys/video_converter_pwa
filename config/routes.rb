Rails.application.routes.draw do
  # Définir la page d'accueil
  root 'home#index'

  # Route pour la conversion vidéo
  post 'convert', to: 'home#convert'

  # Garder les routes de santé et PWA existantes
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest


end
