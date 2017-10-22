Rails.application.routes.draw do
  
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :path => '', controllers: {sessions: 'admin/sessions'}, path_names: { sign_in: '/admin/login',sign_out: '/admin/logout'}
  devise_for :students, :path => '', controllers: {sessions: 'site/sessions'}, path_names: { sign_in: '/login',sign_out: '/logout'}
  root :to => 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :admin do
    resources :teachers
    resources :students
    resources :dashboard
    resources :subjects
    resources :remarks
  end
  
  namespace :site do
    resources :remarks
  end
  get "subjects", to: 'site/subjects#index'
  get "teachers", to: 'site/teachers#index'
  get "teachers/:slug", to: 'site/teachers#show'
  get "subjects/:slug", to: 'site/subjects#show'
  get "class_assignments/:slug", to: 'site/class_assignments#show'
end
