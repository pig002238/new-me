class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to goal_path(@post.goal) 
    else
      puts @post.errors.full_messages
      @goal = @post.goal
      @posts = @goal.posts
      render "goals/show" 
    end
  end

  def show
 end

  private
  def post_params
    params.require(:post).permit(:content, :image).merge(user_id: current_user.id, goal_id: params[:goal_id])
  end

end
