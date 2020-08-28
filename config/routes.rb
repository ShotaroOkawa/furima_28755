Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :item_managements, only: [:index, :create]
  end
  root to: 'items#index'
end
