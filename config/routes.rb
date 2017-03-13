Rails.application.routes.draw do
  resources :conversations, except: :edit

  devise_for :users
  root to: "conversations#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
