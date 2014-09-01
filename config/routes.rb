Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:invitations => 'user_invitations'}
  root to: 'ideas#index'
  resources :ideas
  resources :attachments
  resources :users
end
