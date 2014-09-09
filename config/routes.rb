Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:invitations => 'user_invitations'}
  root to: 'ideas#index'
  resources :ideas
  resources :comments
  resources :tags, :only => [:create]
  resources :attachments
  resources :users

  post '/ideas/:id/rating' => 'ideas#set_rating', :as => 'set_idea_rating'
  post '/comment/:id/like' => 'comments#comment_like', :as => 'comment_like'
  post '/comment/:id/dislike' => 'comments#comment_dislike', :as => 'comment_dislike'
  delete '/tags' => 'tags#destroy'
  put '/user_avatar_update' => 'users#update'
end
