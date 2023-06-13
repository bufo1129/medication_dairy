class Store::CommentsController < ApplicationController
  before_action :authenticate_store!

  def create
    @medication = Medication.find(params[:medication_id])
    @comment = @medication.comments.build(comment_params)
    @comment.store_id = current_store.id
    if @comment.save
      flash[:notice] = "コメント投稿が完了しました"
      # redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "コメント投稿に失敗しました"
      # redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    # redirect_to medication_path(params[:medication_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :medication_id)
  end

end
