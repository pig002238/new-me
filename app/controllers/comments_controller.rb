class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @goals = current_user.goals
    @goal = @post.goal
    @comment = Comment.new(comment_params)
    @comments = @post.comments.order(created_at: :desc)
    @user = @post.user
    if @comment.save
      CommentChannel.broadcast_to @post, { comment: @comment, user: @comment.user }
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
