class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to goal_path(@post.goal)
    else
      render show
    end
  end

  def show
    @goal = @post.goal
    @goals = current_user.goals
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
    @user = @post.user
  end

  def destroy
    @post.destroy
    redirect_to goal_path(@post.goal)
  end

  private
  def post_params
    params.require(:post).permit(:content, :image).merge(user_id: current_user.id, goal_id: params[:goal_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
