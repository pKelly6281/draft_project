Rails.application.routes.draw do


  get 'addpick' => 'picks#new'
  get 'signup' => 'users#new'
  get 'allpicks'    => 'picks#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
 root 'sessions#new'
resources :users

end
