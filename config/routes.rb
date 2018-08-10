Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Advertiser
  post 'advertiser/signup', to: 'advertisers#create'
  post 'advertiser/auth/login', to: 'advertiserauthentication#authenticate'
  ########################
  # Author
  post 'author/signup', to: 'authors#create'
  post 'author/auth/login', to: 'authorauthentication#authenticate'
  ########################
  # User
  post 'user/signup', to: 'users#create'
  post 'user/auth/login', to: 'userauthentication#authenticate'
end
