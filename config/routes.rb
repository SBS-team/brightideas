Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:invitations => 'user_invitations'}
  root to: 'visitors#index'
  resources :ideas
  resources :attachments
end
