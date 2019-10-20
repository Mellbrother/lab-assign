Rails.application.routes.draw do
  get 'registered_students/register'
  root to: 'students#index'
  resources :registered_students
  put 'registered_students/up', to: 'registered_students#rank_up'
  put 'registered_students/down', to: 'registered_students#rank_down'
  resources :students
  resources :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
