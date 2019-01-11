Rails.application.routes.draw do
  devise_for :user
  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root
      resources 'students' do
        get 'new'
        post 'new'
        get 'show'
        get 'index'
        
      end
      resources :attendences
  resources :textbooks
  resources :students
  end
    get 'user/sign_out' => "devise/sessions#destroy"
end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
