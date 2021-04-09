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

  # resources :courses
  get '/courses', to: 'courses#index'

  get '/admin', to: 'admin#index'
  # delete '/admin/del/:course_id' => 'admin#destroy', as: :del_course
  get '/admin/add' => 'admin#new', as: :new_course
  post '/admin/add' => 'admin#add', as: :add_course
  get '/admin/edit/:course_id' => 'admin#edit', as: :edit_course
  put '/admin/update/:course_id' => 'admin#update', as: :update_course

  resources :schedules
  # get '/schedule/:student_id', to: 'schedules#index'
  post '/schedules/add/:student_id/:courses_offering_id' => 'schedules#add', as: :add_schedule
  delete '/schedules/delete/:student_id/:courses_offering_id' => 'schedules#destroy', as: :delete_schedule

end
