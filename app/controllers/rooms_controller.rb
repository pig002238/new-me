class RoomsController < ApplicationController
  
  def index
    @rooms =Room.all
  end
  
  def new
    @room = Room.new
  end

  def search
    @rooms = Room.search(params[:keyword])
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
