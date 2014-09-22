Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:invitations => 'user_invitations'}
  root to: 'ideas#index'

  resources :ideas do
    member do
      post 'rating', to: 'ideas#set_rating'
    end
  end

  resources :comments, only: [:create, :destroy] do
    member do
      get 'like', to: 'comments#comment_like'
      get 'dislike', to: 'comments#comment_dislike'
    end
  end

  resources :tags,     only: [:create, :destroy]
  resources :attachments, only: [:create, :destroy]
  resources :users, only: [:show, :update, :edit]

  delete '/tags' => 'tags#destroy'
  put '/user_avatar_update' => 'users#update'

end
