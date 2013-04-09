Hnclone::Application.routes.draw do

  root :to => "submissions#index"

  resource :session, :only => [:create, :destroy, :new]

  resources :users, :only => [:new, :create, :destroy]

  resources :submissions do
    resources :comments
    post "upvote"
    post "remove_upvote"
  end

  resources :comments, :only => [:new, :create]
end
