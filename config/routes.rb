Hnclone::Application.routes.draw do

  root :to => "submissions#index"

  resource :session, :only => [:create, :destroy, :new]

  resources :users, :except => [:index]

  resources :submissions do
    resources :comments do #REV: so first one for the direct replies, then another
      resources :comments #REV: for all children?
    end
    post "upvote"
    post "remove_upvote"
  end

  resources :comments, :only => [:new, :create]
end
