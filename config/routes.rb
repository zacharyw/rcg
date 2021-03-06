Rails.application.routes.draw do
  resources :conversations, except: :edit
  post '/conversations/mark_read', to: 'conversations#mark_read', as: 'mark_read'

  resources :messages, only: :create

  devise_for :users
  root to: "conversations#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
