class ListsController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    @list = @group.lists.build
    2.times do
      @list.tasks.build
    end
  end

  def create
    @group = Group.find(params[:group_id])
    @list = @group.lists.build(list_params)
    if @list.save
      redirect_to group_list_path(@group, @list)
    else
      flash[:alert] = "List name can not be blank, please try again"
      redirect_to new_group_list_path
    end
  end

  def edit
    @group = List.find_by(params[:group_id])
    @list = List.find(params[:id])
    @list.tasks.build
  end

  def update
    @group = Group.find_by(params[:group_id])
    @list = List.find(params[:id])
    @list.update(list_params)
    if @list.save
      redirect_to group_list_path(@group, @list)
    else
      flash[:alert] = "Unable to edit list, please try again"
      redirect_to new_group_list_path
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to user_path(current_user)
  end

  private

  def list_params
    params.require(:list).permit(:name, :group_id, task_ids:[], tasks_attributes: [:name])
  end

end
