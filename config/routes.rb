Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]

  root 'sessions#index'

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/auth/failure', to: redirect('/')

  get '/home', to: 'sessions#index'

  resources :students
  #tentative route
  # post '/students/:uid/relatedClass' => 'students#add_related_class'

end
