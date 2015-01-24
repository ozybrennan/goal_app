class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    if @comment.commentable.is_a?(Goal)
      redirect_to goal_url(@comment.commentable)
    else
      redirect_to user_url(@comment.commentable)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      if @comment.commentable.is_a?(Goal)
        redirect_to goal_url(@comment.commentable)
      else
        redirect_to user_url(@comment.commentable)
      end
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    if @comment.commentable.is_a?(Goal)
      redirect_to goal_url(@comment.commentable)
    else
      redirect_to user_url(@comment.commentable)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end

end
