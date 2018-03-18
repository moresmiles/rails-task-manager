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
      flash[:alert] = "Unable to create group, please try again"
      redirect_to new_group_path
    end
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to group_path(@group)
  end

  private

  def group_params
    params.require(:group).permit(:name, users_attributes:[:email])
  end

end
