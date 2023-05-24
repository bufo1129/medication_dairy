class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "コメント投稿が完了しました"
      redirect_to admin_medication_path(params[:medication_id])
    else
      flash[:alert] = "コメント投稿に失敗しました"
      render 'admin/medications/show'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_medication_path(params[:medication_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :medication_id)
  end

end