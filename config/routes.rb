Rails.application.routes.draw do  
  
  
  devise_for :usuarios
  # get 'usuarios/sign_in'
  # get 'usuarios/sign_up'
  resources :tareas do
    resources :comentarios
  end
  #Rutas para manipular un recurso (CRUD)
  #get 'tareas', to: "tareas#index"
  #get 'tareas/new', to: "tareas#new"
  #post 'tareas', to: "tareas#create"
  #get 'tareas/:id', to: "tareas#show"  
  #get 'tareas/:id/edit', to: "tareas#edit"
  #put 'tareas/:id', to: "tareas#update"
  #delete 'tareas/:id', to: "tareas#destroy"
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
