Rails.application.routes.draw do
  root to: 'articles#home', as: 'home'
  resources :articles
end
