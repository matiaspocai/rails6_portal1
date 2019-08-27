Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#home', as: 'home'
  resources :articles
end
