Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users do
    resources :messages, only: [:create], controller: 'user_messages'
  end

  get '/search', to: 'users#search', as: 'user_search'

  root 'users#index'

end
