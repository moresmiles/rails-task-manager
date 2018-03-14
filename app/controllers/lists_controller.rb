class ListsController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    @list = @group.lists.build
    @list.tasks.build
  end

  def create
    @group = Group.find(params[:group_id])
    @list = @group.lists.build(list_params)
    if @list.save
      redirect_to group_list_path(@group, @list)
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
    params.require(:list).permit(:name, :group_id, task_ids:[], tasks_attributes: [:id, :name, :list_id])
  end

end
