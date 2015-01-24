class GoalsController < ApplicationController

  def index
    @goals = Goal.all
  end

  def show
    @goal = Goal.find(params[:id])
    if @goal.private_goal && @goal.user_id != current_user.id
      render :index
    else
      render :show
    end
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    @goal.completed ||= false
    if @goal.save
      redirect_to(goal_url(@goal))
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    goal_params[:completed] = false unless goal_params[:completed] == true
    if @goal.update(goal_params)
      redirect_to(goal_url(@goal))
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.delete
    redirect_to(goals_url)
  end

  private

  def goal_params
    params.require(:goal).permit(:body, :private_goal, :completed)
  end

end
