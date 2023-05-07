class Store::DairiesController < ApplicationController
  before_action :authenticate_store!


  def index
    if params[:store_id].present?
      @dairies = Dairy.where(store_id: params[:store_id])
    else
      @dairies = Dairy.all.order(created_at: :desc)
    end
  end

  def new
    @store = current_store
    @dairy = Dairy.new
    pp @store
    pp current_store.prefecture_code
    pp JpPrefecture::Prefecture.find(current_store.prefecture_code)
  end

  def create
    @dairy = Dairy.new(dairy_params)
    @dairy.store_id = current_store.id
    if @dairy.save!
      flash[:notice] = "投稿が完了しました"
      redirect_to dairy_path(@dairy)
    else
      flash[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def show
    @dairy = Dairy.find(params[:id])
  end

  def edit
    @dairy = Dairy.find(params[:id])
  end

  def update
    @dairy = Dairy.find(params[:id])
    if @dairy.update(dairy_params)
      flash[:notice] = "変更が完了しました"
      redirect_to dairy_path(@dairy)
    else
      flash[:alert] = "変更に失敗しました"
      render :edit
    end
  end

  def destroy
    @dairy = Dairy.find(params[:id])
    if @dairy != current_store
      flash[:alert] = "自店のみしか削除できません"
      redirect_to request.referer
    else
      @dairy.destroy
      flash[:notice] = "削除しました"
      redirect_to dairies_path
    end
  end

  private

  def dairy_params
    params.require(:dairy).permit(
      :give_medicine, :medication_id,
      :store_id, :weather, :high_temperature,
      :low_temperature, :title, :body, :created_date
      )
  end

end
