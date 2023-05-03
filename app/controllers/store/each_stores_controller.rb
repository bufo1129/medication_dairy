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
    @each_store = current_store
    if @each_store.update(each_store_params)
      flash[:notice] = "店舗情報を変更しました"
      redirect_to  each_store_path
    else
      render :edit
    end
  end

  private

  def each_store_params
    params.require(:store).permit(
      :name, 
      :email, 
      :postal_code, 
      # :address, 
      :phone_number, 
      :prefecture_name,
      :address_city,
      :address_street,
      :address_building,
      :phone_number,
      :is_deleted)
  end

end
