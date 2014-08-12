Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'
  resources :ideas, :only => [:show]
end
