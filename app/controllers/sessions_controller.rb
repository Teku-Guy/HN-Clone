class SessionsController < ApplicationController
  def create
     if log_in(params[:user][:username], params[:user][:password])
       redirect_to submissions_url
     else
       render :new
     end
   end

  def destroy
   log_out
   redirect_to new_user_url
  end

  def new
  end
end
