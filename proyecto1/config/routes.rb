Rails.application.routes.draw do
  devise_for :usuarios
  get 'event/get_location'
  get 'event/store'
  root :to => 'inicio#index'
  get 'event/map'
  get 'event/date'

#Entra a la carpeta creada "api" se va a manejar por jason
    namespace :api, default: {format: 'json'} do

  	resources :location, only: [:create]
  	
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
