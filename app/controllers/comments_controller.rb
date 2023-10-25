class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to goal_post_path(comment.goal, comment.post) 
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, goal_id: params[:goal_id], post_id: params[:post_id])
  end
end

