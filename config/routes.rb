TftAuthApp::Application.routes.draw do
  get "users/show"

  get "authentications/create"

  get "authentications/index"

  get "authentications/destroy"

  resources :notes
  resources :qrcodes
  resources :authentications
  
  match '/auth/:provider/callback' => 'authentications#create'
  match '/auth/failure' => 'sessions#failure'
  match 'sign_out' => 'sessions#destroy'
  
  get "pages/home"
  

  root :to => "pages#home"
end
