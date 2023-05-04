class Store::DairiesController < ApplicationController

  def new
    @store = current_store
    @dairy = Dairy.new
    #API取得
  end

  def create
    @dairy = Dairy.new(dairy_params)
    @dairy.store_id = current_store.id
    if @dairy.save
      flash[:notice] = "登録が完了しました"
      redirect_to dairy_path
    else
      flash[:alert] = "登録に失敗しました"
      render :new
    end

  end

  def index
    @dairies = Dairy.all
  end

  def show
    @dairy = Dairy.find(params[:id])
  end

  def edit
  end

  private

  def dairy_params
    params.require(:dairy).permit(:give_medicine, :medication_id, :store_id, :weather, :high_temperature, :low_temperature, :title, :body)
  end

end
