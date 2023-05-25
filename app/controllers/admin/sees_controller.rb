class Admin::SeesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_comment

  def create
    see = current_admin.admin_sees.new(comment_id: @comment.id)
    see.save
    redirect_to admin_medication_path(@comment.medication)
  end

  def destroy
    see = current_admin.admin_sees.find_by(comment_id: @comment.id)
    see.destroy
    redirect_to admin_medication_path(@comment.medication)
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

end
