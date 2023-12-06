Rails.application.routes.draw do
  devise_for :users
  root to: "goals#index"
  resources :users, only: [:show] do
    resources :relationships, only: [:create, :destroy]
  end
  resources :goals do
    resources :posts, only: [:create, :show, :destroy] do
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
