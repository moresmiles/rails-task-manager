class GroupsController < ApplicationController

  def new
    @group = Group.new
    2.times do
      @group.users.build
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.users << current_user
      redirect_to group_path(@group)
    else
      flash[:alert] = "Group name can not be blank, please try again"
      redirect_to new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if params[:commit] == 'Update Group'
      @group.update(group_params)
    elsif params[:commit] == 'Remove User(s)'
      users = User.where(id: params[:group][:user_ids]).all
      @group.users.delete(users)
    end
    redirect_to user_path(current_user)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to user_path(current_user)
  end

  private

  def group_params
    params.require(:group).permit(:name, users_attributes:[:email])
  end

end
