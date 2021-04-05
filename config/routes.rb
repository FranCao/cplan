Rails.application.routes.draw do
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

  # get '/schedule/:student_id', to: 'schedules#index'
  post '/schedules/add/:student_id/:courses_offering_id' => 'schedules#add', as: :add_schedule
  delete '/schedules/delete/:student_id/:courses_offering_id' => 'schedules#destroy', as: :delete_schedule

end
