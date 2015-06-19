Rails.application.routes.draw do

  root 'home#home'

  get '/login' =>'sessions#new'
  post '/login'=>'sessions#create'

  get '/users/new'=>'users#new'

  get '/logout' => 'sessions#destroy'

  get '/logged' =>"users#logged"

  get '/home' => "home#home"

  get '/delete'=>"events#destroy"

  resources :users

  resources :events


end
