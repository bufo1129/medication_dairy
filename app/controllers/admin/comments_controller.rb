class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to admin_medication_path(@comment.medication)
    else
      @medication = @comment.medication
      @comments = @medication.comments.includes(:store)
      render "admin/medications/show"
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id], medication_id: params[:medication_id])
    comment.destroy
    redirect_to admin_medication_path(comment.medication)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:comment).merge(store_id: current_store.id, store_id: params[:medication_id])
  end
  
end