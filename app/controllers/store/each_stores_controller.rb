class Store::EachStoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def show
    @each_store = Store.find(params[:id])
  end

  def edit
    @each_store = current_store
  end

  def update
    byebug
    @each_store = current_store
    if @each_store.update(each_store_params)
      flash[:notice] = "店舗情報を変更しました"
      redirect_to  each_store_path
    else
      render :edit
    end
  end

  def close
    @store = current_store
  end

  def withdraw
    @store = current_store
    @store.update(is_deleted: true)
    reset_session
    flash[:notice] = "店舗登録を削除しました"
    redirect_to root_path
  end

  private

  def each_store_params
    params.require(:store).permit(:name, :email, :postal_code, :address, :phone_number, :is_deleted)
  end

end
