Rails.application.routes.draw do
  devise_for :users
  root to: "goals#index"
  resources :goals do
    resources :posts, only: [:create, :show] do
      resources :comments, only: [:create]
    end
  end
  resources :rooms, only: [:index, :new, :create]
end
