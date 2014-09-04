Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:invitations => 'user_invitations'}
  root to: 'ideas#index'
  resources :ideas
  resources :comments
  resources :attachments
  resources :users

  post '/ideas/:id/rating' => 'ideas#set_rating', :as => 'set_idea_rating'
  # get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment

end
