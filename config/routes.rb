Rails.application.routes.draw do
  devise_for :users
  root "companies#show"

  resources :companies, only: [:show, :edit, :update, :destroy] do
  end

end
