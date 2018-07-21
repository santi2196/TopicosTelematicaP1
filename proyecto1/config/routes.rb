Rails.application.routes.draw do
  devise_for :usuarios
  get 'event/get_location'
  get 'event/store'
  root :to => 'inicio#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
