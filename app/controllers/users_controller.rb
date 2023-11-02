class UsersController < ApplicationController

  def show
    @goals = current_user.goals
  end

end
