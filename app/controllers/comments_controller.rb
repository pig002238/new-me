class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to goal_post_path(@comment.post.goal_id, @comment.post.id)
    else
      render "goals/show" 
    end
  end
  
  

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end

