Hnclone::Application.routes.draw do

  root :to => "submissions#index"

  resource :session, :only => [:create, :destroy, :new]

  resources :users, :except => [:index]

  resources :submissions do
    resources :comments do
      resources :comments
    end
    post "upvote"
    post "remove_upvote"
  end

  resources :comments, :only => [:new, :create]
end
