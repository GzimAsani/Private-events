Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create]
  resources :events, only: %i[new index show create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
