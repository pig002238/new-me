class GoalsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]

  def index
    @goals = Goal.all.includes(:user)
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to root_path
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
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.posts.destroy
    redirect_to root_path
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
