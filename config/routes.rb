Rails.application.routes.draw do
  resources :galleries, only: [:show]

  root 'galleries#show'
end
