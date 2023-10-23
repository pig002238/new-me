class GoalsController < ApplicationController
  before_action :authenticate_user! # ログインユーザーのみアクセス可
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]

  def index
    @goals = Goal.all
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
    @goal.destroy
    redirect_to root_path
  end

  private

  def goal_params
    params.require(:goal).permit( :purpose, :goal, :action, :deadline).merge(user_id: current_user.id)
  end

  def set_tweet
    @goal = Goal.find(params[:id])
  end
end
