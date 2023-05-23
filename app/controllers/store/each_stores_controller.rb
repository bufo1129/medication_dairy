class Store::EachStoresController < ApplicationController
  before_action :authenticate_store!
  # before_action :ensure_guest_user, only: [:edit]

  def index
    @stores = Store.all.page(params[:page]).per(10)
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

  # def ensure_guest_user
  #   @store = Store.find(params[:id])
  #   if @store.name == "guestuser"
  #     redirect_to each_store_path(current_store) , notice: 'ゲストユーザーは編集画面へ遷移できません。'
  #   end
  # end

end
