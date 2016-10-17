Rails.application.routes.draw do
  # root 'controller_name#action_name'
  root 'pages#home'
  # Note: The above is the same as get '/' => 'pages#home' which is the same as:

  get 'about' => 'pages#about'

  get 'contact' => 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
