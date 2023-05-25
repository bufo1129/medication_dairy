class Store::SeesController < ApplicationController
  before_action :authenticate_store!
  before_action :set_comment

  def create
    see = current_store.sees.new(comment_id: @comment.id)
    see.save
    redirect_to medication_path(@comment.medication)
  end

  def destroy
    see = current_store.sees.find_by(comment_id: @comment.id)
    see.destroy
    redirect_to medication_path(@comment.medication)
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

end
