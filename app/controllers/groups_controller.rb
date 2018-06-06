class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @groups}
    end
  end

  def show
    @group = Group.find(params[:id])
    groups = current_user.groups.order('groups.id ASC')
    @next_group = groups.where('groups.id > ?', @group.id).first
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @group}
    end
  end

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
      redirect_to user_path(current_user)
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
