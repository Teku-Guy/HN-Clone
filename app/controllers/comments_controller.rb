class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      flash[:success] = "Comment posted"
      redirect_to @comment.submission
    else
      flash[:error] = "There was an error posting your comment"
      render :new
    end
  end
end
