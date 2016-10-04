Rails.application.routes.draw do
  resources :cats

  post 'owners', to: 'owners#create', as: :create_owner
end
