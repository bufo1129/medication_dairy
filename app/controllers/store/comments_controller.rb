class Store::CommentsController < ApplicationController
  before_action :authenticate_store!

  def create
    @comment = current_store.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to medication_path(params[:medication_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :medication_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end

end
