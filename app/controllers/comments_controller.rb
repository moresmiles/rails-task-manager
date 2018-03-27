class CommentsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.list_id = @list.id
    if @comment.save
      redirect_to group_list_path(@list.group, @list)
    else
      flash[:alert] = "Your comment could not be saved!"
      redirect_to group_list_path(@list.group, @list)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to group_list_path(@comment.list.group, @comment.list)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to group_list_path(@comment.list.group, @comment.list)
  end

  private

  def comment_params
    params.permit(:content, :list_id, :user_id)
  end
end
