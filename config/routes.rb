Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create]
  resources :events, only: %i[new index show create]
  resources :attendances, only: %i[create destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
