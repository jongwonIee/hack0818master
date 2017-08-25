Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]


  root 'home#main'
  get 'home/main'
  
   resources :posts do
   resources :comments, only: [:create]
  end
  
  get 'contents/index'
  post 'contents/index'
  
  resources :contents, except: [:create] do
  end
  # 계산기
  # get 'calculator/input' => 'calculator#input'
  # get 'calculator/result'=> 'calculator#result'
  #지도(독립)
  # get 'maps/main' => 'maps#main'
  # post 'maps/main' => 'maps#main'
  # post 'maps/main/:lat' => 'maps#main' # To pass JS variable 
  # post 'maps/main/:lng' => 'maps#main'
  
  #지도(POST)
  get 'maps/main' => 'maps#main'
  post 'maps/main' => 'maps#main'
  post 'maps/main/:lat' => 'maps#main' # To pass JS variable 
  post 'maps/main/:lng' => 'maps#main'
  
  get 'posts/create' => 'posts#create'
  post 'posts/new/:lat' => 'posts#create' # To pass JS variable 
  post 'posts/new/:lng' => 'posts#create'
  match 'posts/coordinates' => 'posts#create', :via => [:get], :as => 'post_create'
  
  post 'users/favorites_delete'
  post 'users/favorites_add'
  
  get 'users/myposts'
  get 'users/mypage'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users
  resources :sessions


end
