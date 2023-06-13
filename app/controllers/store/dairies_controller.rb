class Store::DairiesController < ApplicationController
  before_action :authenticate_store!
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index

    #店舗詳細からその店舗の日報一覧へ+並べ替え
    if params[:store_id].present?
      if params[:latest]
        @dairies = Dairy.where(store_id: params[:store_id]).latest.page(params[:page]).per(10)
      elsif params[:old]
        @dairies = Dairy.where(store_id: params[:store_id]).old.page(params[:page]).per(10)
      else
        @dairies = Dairy.where(store_id: params[:store_id]).order(created_at: :desc).page(params[:page]).per(10)
      end
    else
      #日報一覧並べ替え
      if params[:latest]
        @dairies = Dairy.all.latest.page(params[:page]).per(10)
      elsif params[:old]
        @dairies = Dairy.all.old.page(params[:page]).per(10)
      else
        @dairies = Dairy.all.order(created_at: :desc).page(params[:page]).per(10)
      end
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
    if @dairy.save
      flash[:notice] = "投稿が完了しました"
      redirect_to dairy_path(@dairy)
    else
      flash[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def show
    @each_store = current_store
    @store = current_store
  end

  def edit
    @store = current_store
  end

  def update
    if @dairy.update(dairy_params)
      flash[:notice] = "変更が完了しました"
      redirect_to dairy_path(@dairy)
    else
      flash[:alert] = "変更に失敗しました"
      render :edit
    end
  end

  def destroy
    if @dairy.store != current_store
      flash[:alert] = "ログイン店舗以外は削除できません"
      redirect_to request.referer
    else
      @dairy.destroy
      flash[:notice] = "削除しました"
      redirect_to dairies_path
    end
  end
  
  # 日報の複製
  def copy
    @old_dairy = Dairy.find_by(id: params[:dairy_id])
    @dairy = @old_dairy.deep_clone
    @dairy.save
    redirect_to edit_dairy_path(@dairy.id), notice: 'コピーしました。'
  end

  private

  def set_store
    @dairy = Dairy.find(params[:id])
  end

  def dairy_params
    params.require(:dairy).permit(
      :give_medicine,
      :medication_id,
      :store_id,
      :weather_id,
      :high_temperature,
      :low_temperature,
      :title,
      :body,
      :created_date,
      :humidity,
      dairy_items_attributes:
        [:id, :title, :body, :_destroy]
      )
  end

end
