class SubmissionsController < ApplicationController

  def index
    @submissions = Submission.all
  end

  def new
    @submission = Submission.new
    @submission.comments.build
  end

  def create
    @submission = Submission.new(params[:submission])

    if @submission.save
      flash[:success] = "Submission added"
      @submission.user.add_karma
      redirect_to @submission
    else
      flash[:error] = "There was an error adding your submission"
      render :new
    end
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def upvote
    submission = Submission.find(params[:submission_id])
    if logged_in? && !submission.user_voted?(current_user.id)
      submission.upvote(current_user.id)
      flash[:success] = "Upvote added"
    else
      flash[:error] = "You have either already voted or are not logged in"
    end
    redirect_to submission
  end

  def remove_upvote
    submission = Submission.find(params[:submission_id])
    if logged_in? && submission.user_voted?(current_user.id)
      submission.remove_upvote(current_user.id)
      flash[:success] = "Upvote removed"
    else
      flash[:error] = "You havent already voted or are not logged in"
    end
    redirect_to submission
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def update
    @submission = Submission.find(params[:id])
    @submission.update_attributes(params[:submission])

    if @submission.save
      flash[:success] = "Submission updated"
      redirect_to @submission
    else
      flash[:error] = "There was an error updating your submission"
      render :edit
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
  end
end
