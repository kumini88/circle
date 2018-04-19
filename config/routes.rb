Rails.application.routes.draw do
  #toppage________________________________________________________________________________________
  root to: "toppages#index"
  get "search", to:"toppages#search"
  
  #session________________________________________________________________________________________
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  #user___________________________________________________________________________________________
  resources :users, only: [:show, :edit, :update, :new, :create]
  
  #relationship_________________________________________________________________
  resources :relationships, only: [:create, :destroy]
  
  
  #group__________________________________________________________________________________________
  resources :groups, only: [:show, :edit, :update, :new, :create]
  
  #member_______________________________________________________________________
  resources :members, only: [:create, :destroy]
  
  #applicant____________________________________________________________________
  resources :applicants, only: [:create, :destroy]

  #grouprelationship____________________________________________________________
  resources :grouprelationships, only: [:create, :destroy]
  
  
  #company________________________________________________________________________________________
  resources :companies, only: [:show, :edit, :update, :new, :create]
  
  #companymember________________________________________________________________
  resources :companymembers, only: [:create, :destroy]
  
  #companyrelationship__________________________________________________________
  resources :companyrelationships, only: [:create, :destroy]
  
  #review_______________________________________________________________________
  resources :reviews, only: [:show, :new, :create, :destroy]


  #post___________________________________________________________________________________________
  resources :posts, only: [:show, :new, :create, :destroy] do
    member do
      get :favorite_users
    end
  end
  
  #favorite_____________________________________________________________________
  resources :favorites, only: [:create, :destroy]
  
  #comment______________________________________________________________________
  resources :comments, only: [:new, :create, :destroy]


  #event__________________________________________________________________________________________
  resources :events, only: [:show, :new, :create, :destroy] do
    member do
      get :clip_users
      get :join_users
    end
  end
  
  #clip_________________________________________________________________________
  resources :clips, only: [:create, :destroy]
  
  #join_________________________________________________________________________
  resources :joins, only: [:create, :destroy]
  
  #eventcomment_________________________________________________________________
  resources :eventcomments, only: [:new, :create, :destroy]

  
  resources :rooms

end