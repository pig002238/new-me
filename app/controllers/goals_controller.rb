class GoalsController < ApplicationController
  def index
   
  end

  def new
    @goals = Goal.new
  end

end
