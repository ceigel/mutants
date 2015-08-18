class TasksController < ApplicationController
  before_filter :authenticate_mutant!
  before_action :set_team
  before_action :set_task, only: [:edit, :update, :destroy]

  respond_to :html

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = @team.tasks.build(task_params)

    if @task.save
      redirect_to @team, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @team, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to @team, notice: 'Task was successfully destroyed.'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def set_team
      @team = Team.find(params[:team_id])
    end

    def task_params
      params.require(:task).permit(:name, :team_id)
    end
end
