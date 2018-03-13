class ListsController < ApplicationController

  def new
    @list = List.new
    @list.tasks.build
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to group_list_path(@list)
    else
      flash[:alert] = "Unable to create list, please try again"
      redirect_to new_group_list_path
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def index
    @lists = List.all
  end

  private

  def list_params
    params.require(:list).permit(:name, task_ids:[], tasks_attributes: [:id, :name, :list_id])
  end

end
