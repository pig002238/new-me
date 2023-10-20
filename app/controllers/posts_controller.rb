class PostsController < ApplicationController
  def create
    Posts.create(post_params)
    redirect_to "/posts/#{content.post.id}"
  end

  private
  def post_params
    params.require(:posts).permit(:content).merge(user_id: current_user.id, goal_id: params[:goal_id])
  end

end
