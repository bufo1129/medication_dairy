class Admin::DairiesController < ApplicationController
  before_action :authenticate_admin!

  def index
    #店舗詳細からその店舗の日報一覧へ+並べ替え
    if params[:store_id].present?
      if params[:latest]
        @dairies = Dairy.where(store_id: params[:store_id]).latest.page(params[:page]).per(10)
      elsif params[:old]
        @dairies = Dairy.where(store_id: params[:store_id]).old.page(params[:page]).per(10)
      else
        @dairies = Dairy.where(store_id: params[:store_id]).page(params[:page]).per(10)
      end
    else
      #日報一覧並べ替え
      if params[:latest]
        @dairies = Dairy.all.latest.page(params[:page]).per(10)
      elsif params[:old]
        @dairies = Dairy.all.old.page(params[:page]).per(10)
      else
        @dairies = Dairy.all.page(params[:page]).per(10)
      end
    end
  end

  def show
    @dairy = Dairy.find(params[:id])
  end

  private

  def dairy_params
    params.require(:dairy).permit(
      :give_medicine,
      :medication_id,
      :store_id,
      :weather,
      :high_temperature,
      :low_temperature,
      :title,
      :body,
      :created_date
      )
  end

end
