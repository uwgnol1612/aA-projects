Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :bands

  resources :bands do   
    resources :albums, only: [:new, :index]
  end    
  
  resources :albums, only: [:create, :edit, :show, :update, :destroy]

  resources :albums do   
      resources :tracks, only: [:new, :index]
  end 

  resources :tracks, only: [:create, :edit, :show, :update, :destroy]

  resources :notes, only: [:create, :destroy]
end
