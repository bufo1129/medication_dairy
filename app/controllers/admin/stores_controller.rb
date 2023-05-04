class Admin::StoresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_store, only: [:show, :update]

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      flash[:notice] = "店舗情報が更新されました"
      redirect_to admin_store_path(@store)
    else
      flash[:alert] = "店舗情報の更新に失敗しました"
      render :edit
    end
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(
      :name, :email, :postal_code,
      :phone_number, :is_deleted,
      :prefecture_name, :address_city,
      :address_street, :address_building)
  end

end
