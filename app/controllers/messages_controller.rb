class MessagesController < ApplicationController
  def index
    @rooms = Room.all
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user).order(created_at: :desc)
  end

  def create
    @room = Room.find(params[:room_id])
    @rooms = current_user.rooms
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
