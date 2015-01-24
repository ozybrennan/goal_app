class CheersController < ApplicationController

  def create
    @cheer = Cheer.create!(goal_id: params[:goal_id], user_id: current_user.id)
    current_user.cheers -= 1
    current_user.save!
    redirect_to goal_url(@cheer.goal)
  end

  def destroy
    @cheer = Cheer.find(params[:id])
    @cheer.delete
    current_user.cheers += 1
    current_user.save!
    redirect_to goal_url(@cheer.goal)
  end

end
