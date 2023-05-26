class Store::EachStoresController < ApplicationController
  before_action :authenticate_store!

  def index
    @stores = Store.all.page(params[:page]).per(10)
  end

  def show
    @each_store = Store.find(params[:id])

    # @medications = @each_store.medications
    # favorites = Favorite.where(store_id: current_store.id).pluck(:medication_id)
    # @favorite_list = Medication.find(favorites)
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
      flash[:alert] = "変更に失敗しました"
      render :edit
    end
  end

  private

  def each_store_params
    params.require(:store).permit(
      :name,
      :email,
      :postal_code,
      :phone_number,
      :prefecture_name,
      :address_city,
      :address_street,
      :address_building,
      :phone_number,
      :is_deleted,
      :prefecture_code)
  end

end
