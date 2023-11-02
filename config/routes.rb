Rails.application.routes.draw do
  devise_for :users
  root to: "goals#index"
  resources :users, only: [:show]
  resources :goals do
    resources :posts, only: [:create, :show] do
      resources :comments, only: [:create]
    end
  end

  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create] 
      collection do
        get "search"
      end
  end
end
