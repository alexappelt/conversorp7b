Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :conversor
  resources :lista

  post '/gerar' , to: 'conversor#gerar'


end
