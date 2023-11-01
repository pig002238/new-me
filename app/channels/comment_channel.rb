class CommentChannel < ApplicationCable::Channel
  def subscribed
    @post = Post.find(params[:item_id])
    stream_for @post
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
