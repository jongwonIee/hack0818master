Rails.application.routes.draw do
  devise_for :users
  get 'user/myposts'

  
  resources :sessions, only: [:new, :create, :destroy]

  get 'user/mypage'

  root 'home#main'
  get 'home/main'

  
  
   resources :posts do
   resources :comments, only: [:create]
  end
  
  get 'contents/index'
  post 'contents/index'
  
  resources :contents, except: [:create] do
  end



  get 'calculator/input' => 'calculator#input'

  get 'calculator/result'=> 'calculator#result'
  
  get 'maps/main' => 'maps#main'
  post 'maps/main' => 'maps#main'
  post 'maps/main/:lat' => 'maps#main' # To pass JS variable 
  post 'maps/main/:lng' => 'maps#main'
  
  post 'users/favorites_delete'
  post 'users/favorites_add'
end
