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
      comment = @comment.dup

    until comment.parent_id.nil?
      ca = CommentAncestor.create!(
        :ancestor_id => comment.parent_id,
        :descendant_id => @comment.id
      )
      comment = Comment.find(ca.ancestor_id)
    end


      flash[:success] = "Comment posted"
      redirect_to @comment.submission
    else
      flash[:error] = "There was an error posting your comment"
      render :new
    end
  end
end
