Rails.application.routes.draw do
  resources :galleries, only: [:show]
  resources :images, only: [:create, :destroy] do
    collection do
      patch :bulk_create
    end
  end

  root 'galleries#show'
end
