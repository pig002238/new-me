class GoalsController < ApplicationController
  before_action :authenticate_user! # ログインユーザーのみアクセス可
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

  private

  def goal_params
    params.require(:goal).permit( :purpose, :goal, :action, :deadline).merge(user_id: current_user.id)
  end
end
