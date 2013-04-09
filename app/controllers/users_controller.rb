class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = "Account successfully created"
      redirect_to submissions_path
    else
      flash[:error] = "There were some errors creating your account"
      render :new
    end
  end
end
