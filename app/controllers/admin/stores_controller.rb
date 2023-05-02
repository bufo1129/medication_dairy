class Admin::StoresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_store, only: [:show, :update]

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    @store.update
    redirect_to request.referer
    # フラッシュメッセも
  end
  
  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:is_deleted)
  end

end
