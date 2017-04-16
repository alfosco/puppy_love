Rails.application.routes.draw do
  root 'dogs#index'
  post '/search', to: 'search#index', as: 'search'
  
  resources :dogs, only: [:index, :show]
end
