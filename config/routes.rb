Rails.application.routes.draw do
  devise_for :users
  root to: "goals#index"
  resources :goals do
    resources :posts do
      resources :comments
      collection do
        get 'search'
      end
    end
  end
end
