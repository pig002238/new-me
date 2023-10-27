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
      redirect_to rooms_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
