class UsersController < ApplicationController

  def new
    @user = User.new
    3.times { @user.emails.build }
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = "Account successfully created"
      redirect_to new_session_path
    else
      flash[:error] = "There were some errors creating your account"
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Account successfully deleted"
    redirect_to submissions_path
  end
end
