class TasksController < ApplicationController

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to group_list_path(@task.list.group, @task.list)
  end

  def destroy
    @list = List.find_by(params[:list_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to group_list_path(@list.group, @list)
  end

  private
  def task_params
    params.require(:task).permit(:status, :user_id)
  end
end
