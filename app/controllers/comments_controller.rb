class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
  @goal = @post.goal
  @comment = Comment.new(comment_params)
  @comments = @post.comments.includes(:user)
  @user = @post.user
    if @comment.save
      redirect_to goal_post_path(@comment.post.goal_id, @comment.post.id)
    else
      render "posts/show"
    end
  end
  
  

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end

