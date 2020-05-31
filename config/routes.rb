Rails.application.routes.draw do
  resources :articles
  root to: 'top#index'
end
