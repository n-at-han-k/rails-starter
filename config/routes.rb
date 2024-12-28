Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Dokku Zero-downtime Deploys
  # get '/check.txt', to: proc {[200, {}, ['simple_check']]}

  root "home#index"

  devise_for :users, path: 'app/users', controllers: {
    sessions:       'user/sessions',
    confirmations:  'user/confirmations',
    passwords:      'user/passwords',
    registrations:  'user/registrations',
    unlocks:        'user/unlocks',
    # invitations:    'user/invitations' # Devise Invitable Gem
  }

  if Rails.env.development?
    mount Lookbook::Engine, at: 'lookbook'
  end
end
