Rails.application.routes.draw do
  
  get 'feed', to: 'feed#show'

  #get 'users/show'
  # get 'users/:username' => 'users#show', as: 'user'

  resources :users, only: :show, param: :username do 
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end

  resources :stories
  resources :tweets
  as :user do
    get 'reviews' => 'tweets#index'
  end
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get 'sign_in' => 'devise/sessions#new' 
    delete 'sign_out' => 'devise/sessions#destroy' 
    get 'sign_up' =>'devise/registrations#new' 
    get 'account' => 'devise/registrations#edit'
  end

  root 'pages#home' 

  get 'about' => 'pages#about'
  
  get 'contact' =>'pages#contact'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 