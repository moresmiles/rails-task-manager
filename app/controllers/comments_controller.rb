class CommentsController < ApplicationController

  def create
    @list = List.find(params[:comment][:list_id])
    @comment = @list.comments.build(content: params[:comment][:content], user_id: current_user.id)
    if @comment.save
        render json: @comment, status: 201
    else
      flash[:alert] = "Your comment could not be saved"
      redirect_to group_list_path(@list.group, @list)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(content: params[:content])
    redirect_to group_list_path(@comment.list.group, @comment.list)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to group_list_path(@comment.list.group, @comment.list)
  end

  private

  def comment_params
    params.permit(:comment)
  end
end
