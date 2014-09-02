Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:invitations => 'user_invitations'}
  root to: 'ideas#index'
  resources :ideas
  resources :users
  resources :attachments
  resources :users

  post '/ideas/:id/rating' => 'ideas#set_rating', :as => 'set_idea_rating'
end
