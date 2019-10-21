Rails.application.routes.draw do
  root to: 'students#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  put 'registered_students/up', to: 'registered_students#rank_up'
  put 'registered_students/down', to: 'registered_students#rank_down'
  put 'registered_teachers/up', to: 'registered_teachers#rank_up'
  put 'registered_teachers/down', to: 'registered_teachers#rank_down'
  get 'registered_students/register', to: 'registered_students#register'
  get 'registered_teachers/register', to: 'registered_teachers#register'
  resources :registered_students
  resources :registered_teachers
  resources :students
  resources :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
