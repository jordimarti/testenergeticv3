Rails.application.routes.draw do
  resources :entitats
  get 'entitats/:id/ambits', to: 'entitats#ambits', as: 'entitat_ambits'
  get 'entitats/:id/aixecament', to: 'entitats#aixecament', as: 'entitat_aixecament'
  devise_for :users
  get 'home/index'
  get 'home/contacta'
  root :to => "home#index"
end
