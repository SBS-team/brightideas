Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:invitations => 'user_invitations'}
  root to: 'visitors#index'
  resources :ideas
  resources :users
  resources :tags, :only => [:create]
  delete '/tags' => 'tags#destroy'
  put '/user_avatar_update' => 'users#update'
  resources :attachments
end
