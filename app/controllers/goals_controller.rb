class GoalsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]

 

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @posts = @goal.posts
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to user_path(current_user.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy
    redirect_to user_path(current_user.id)
  end

  def search
    @goals = Goal.search(params[:keyword])
  end

  private

  def goal_params
    params.require(:goal).permit( :purpose, :goal, :action, :deadline).merge(user_id: current_user.id)
  end

  def set_tweet
    @goal = Goal.find(params[:id])
  end
end
