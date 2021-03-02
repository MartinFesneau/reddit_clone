class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable
    else
      redirect_to @commentable, alert: "Something went wrong"
    end
  end

  def destroy
    @comment = @commentable.comments.where(user: current_user).find(params[:id])
    @comment.destroy
    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end