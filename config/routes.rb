Rails.application.routes.draw do
  devise_for :users
  root "companies#show"
  resources :companies, only: [:show, :edit, :update, :destroy] do
    resources :sites do
      collection do
        get 'search'
      end
    end
    resources :excesses do
      collection do
        get 'search'
      end
    end
  end
  resources :users, only: [:show, :edit, :update]

end