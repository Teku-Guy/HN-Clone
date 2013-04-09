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

      new_ca = CommentAncestor.create!(:ancestor_id => @comment.parent_id,
                              :comment_id => @comment.id)
      ca = CommentAncestor.find(new_ca.ancestor_id)
      ca.descendant_id = new_ca.id
      ca.save!

      flash[:success] = "Comment posted"
      redirect_to @comment.submission
    else
      flash[:error] = "There was an error posting your comment"
      render :new
    end
  end
end
