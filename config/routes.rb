Rails.application.routes.draw do
  resources :lampades
  resources :component_murs
  get 'component_murs/canviar_posicio'
  resources :cobertes
  resources :forats
  resources :murs
  resources :entitats
  get 'entitats/:id/ambits', to: 'entitats#ambits', as: 'entitat_ambits'
  get 'entitats/:id/aixecament', to: 'entitats#aixecament', as: 'entitat_aixecament'
  get 'entitats/:id/envolupant', to: 'entitats#envolupant', as: 'entitat_envolupant'
  get 'entitats/:id/iluminacio', to: 'entitats#iluminacio', as: 'entitat_iluminacio'
  get 'entitats/:id/propostes', to: 'entitats#propostes', as: 'entitat_propostes'
  get 'entitats/:id/documents', to: 'entitats#documents', as: 'entitat_documents'
  devise_for :users
  get 'home/index'
  get 'home/contacta'
  root :to => "home#index"
end
