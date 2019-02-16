Rails.application.routes.draw do

  resources :comments
  resources :posts
  devise_for :user
  devise_scope :user do

    authenticated :user do
      root 'home#index', as: :authenticated_root
      resources 'attendences' do
      post 'attendences/new' => "attendences#create"
    end
      resources 'students' do
        get 'new'
        post 'new'
        get 'show'
        get 'index'
        
      end
 resources :textbooks
  resources :students
  resources :posts   
  end
    get 'user/sign_out' => "devise/sessions#destroy"
    post 'attendences/new' => "attendences#create"
    unauthenticated do
      root 'home#index', as: :unauthenticated_root
      get '/gallery'=> "home#gallery"
      get '/about'=> "home#about"
      get '/contact'=> "home#contact"
      resources :posts do
'posts#index'
end
    end
end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
