Rails.application.routes.draw do
  get '/schedule', to: 'schedules#index'
  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :sessions, only: [:new, :create, :destroy]

  root 'sessions#index'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/auth/failure', to: redirect('/')

  get '/home', to: 'sessions#index'
  delete '/logout', to: 'sessions#destroy'

  post '/students/:id/remove_course/:course_id' => 'students#remove_course', as: :remove_course

  #tentative route
  # post '/students/:uid/relatedClass' => 'students#add_related_class'

  resources :courses
  resources :schedules

  post 'schedule/add/:courses_offering_id' => 'schedules#add', as: :add_schedule 

end
