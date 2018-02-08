Rails.application.routes.draw do
  resources :users
  root 'users#index'
  
  patch 'users/:id', to: 'user#sendMail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
