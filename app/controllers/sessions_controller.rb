class SessionsController < ApplicationController
  def create
     if log_in(params[:user][:username], params[:user][:password])
       redirect_to root_url
     else
       render :new
     end
   end

  def destroy
   log_out
   empty_cart
   redirect_to root_url
  end

  def new
  end
end
