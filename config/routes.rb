Rails.application.routes.draw do
  get 'component_predefinit_murs/select', to: 'component_predefinit_murs#select', as: 'select_component_predefinit_mur'
  get 'component_predefinit_murs/afegeix', to: 'component_predefinit_murs#afegeix', as: 'afegeix_component_predefinit_mur'
  resources :component_predefinit_murs
  get 'forat_predefinits/afegeix'
  resources :forat_predefinits
  resources :terres
  resources :component_cobertes
  resources :forats
  resources :habits
  resources :aparells
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
  resources :murs
  resources :entitats do
    resource :download, only: [:show]
  end
  get 'entitats/:id/ambits', to: 'entitats#ambits', as: 'entitat_ambits'
  get 'entitats/:id/aixecament', to: 'entitats#aixecament', as: 'entitat_aixecament'
  get 'entitats/:id/envolupant', to: 'entitats#envolupant', as: 'entitat_envolupant'
  get 'entitats/:id/iluminacio', to: 'entitats#iluminacio', as: 'entitat_iluminacio'
  get 'entitats/:id/clima', to: 'entitats#clima', as: 'entitat_clima'
  get 'entitats/:id/aparells', to: 'entitats#aparells', as: 'entitat_aparells'
  get 'entitats/:id/habits', to: 'entitats#habits', as: 'entitat_habits'
  get 'entitats/:id/consums', to: 'entitats#consums', as: 'entitat_consums'
  get 'entitats/:id/propostes', to: 'entitats#propostes', as: 'entitat_propostes'
  get 'entitats/:id/documents', to: 'entitats#documents', as: 'entitat_documents'
  #get 'entitats/:id/generar_propostes', to: 'entitats#generar_propostes', as: 'generar_propostes'
  devise_for :users
  get 'home/index'
  get 'home/contacta'
  root :to => "home#index"
end
