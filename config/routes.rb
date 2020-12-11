Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:new, :show, :create]
end
