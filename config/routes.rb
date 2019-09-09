Rails.application.routes.draw do
  get 'documents/index'
  resources :consum_globals
  get 'propostes/generar_propostes'
  resources :propostes
  
  resources :proposta_predefinides
  resources :climatitzacions
  resources :lampades
  resources :component_murs
  get 'component_murs/canviar_posicio'
  resources :cobertes
  resources :forats
  resources :murs
  resources :entitats do
    resource :download, only: [:show]
  end
  get 'entitats/:id/ambits', to: 'entitats#ambits', as: 'entitat_ambits'
  get 'entitats/:id/aixecament', to: 'entitats#aixecament', as: 'entitat_aixecament'
  get 'entitats/:id/envolupant', to: 'entitats#envolupant', as: 'entitat_envolupant'
  get 'entitats/:id/iluminacio', to: 'entitats#iluminacio', as: 'entitat_iluminacio'
  get 'entitats/:id/clima', to: 'entitats#clima', as: 'entitat_clima'
  get 'entitats/:id/propostes', to: 'entitats#propostes', as: 'entitat_propostes'
  get 'entitats/:id/documents', to: 'entitats#documents', as: 'entitat_documents'
  #get 'entitats/:id/generar_propostes', to: 'entitats#generar_propostes', as: 'generar_propostes'
  devise_for :users
  get 'home/index'
  get 'home/contacta'
  root :to => "home#index"
end
