class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      flash[:alert] = "Unable to create list, please try again"
      redirect_to new_list_path
    end
  end

  def show
    @lists = List.all
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
