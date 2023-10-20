Rails.application.routes.draw do
  devise_for :users
  root to: "goals#index"
  resources :goals do
    resources :posts, only: :create
  end
end
