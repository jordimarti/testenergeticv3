Rails.application.routes.draw do
  
  
  resources :certificacions
  resources :component_predefinits
  get 'forat_predefinits/afegeix'
  resources :forat_predefinits
  resources :terres
  get 'component_cobertes/select', to: 'component_cobertes#select', as: 'select_component_coberta'
  get 'component_cobertes/afegeix', to: 'component_cobertes#afegeix', as: 'afegeix_component_coberta'
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
  get 'component_murs/select', to: 'component_murs#select', as: 'select_component_mur'
  get 'component_murs/afegeix', to: 'component_murs#afegeix', as: 'afegeix_component_mur'
  resources :component_murs
  resources :cobertes
  resources :murs
  resources :entitats
  get 'entitats/:id/ambits', to: 'entitats#ambits', as: 'entitat_ambits'
  get 'entitats/:id/aixecament', to: 'entitats#aixecament', as: 'entitat_aixecament'
  get 'entitats/:id/envolupant', to: 'entitats#envolupant', as: 'entitat_envolupant'
  get 'entitats/:id/iluminacio', to: 'entitats#iluminacio', as: 'entitat_iluminacio'
  get 'entitats/:id/clima', to: 'entitats#clima', as: 'entitat_clima'
  get 'entitats/:id/aparells', to: 'entitats#aparells', as: 'entitat_aparells'
  get 'entitats/:id/habits', to: 'entitats#habits', as: 'entitat_habits'
  get 'entitats/:id/consums', to: 'entitats#consums', as: 'entitat_consums'
  get 'entitats/:id/certificacio', to: 'entitats#certificacio', as: 'entitat_certificacio'
  get 'entitats/:id/propostes', to: 'entitats#propostes', as: 'entitat_propostes'
  get 'entitats/:id/documents', to: 'entitats#documents', as: 'entitat_documents'
  #get 'entitats/:id/generar_propostes', to: 'entitats#generar_propostes', as: 'generar_propostes'
  devise_for :users
  get 'home/index'
  get 'home/contacta'
  root :to => "home#index"
end
