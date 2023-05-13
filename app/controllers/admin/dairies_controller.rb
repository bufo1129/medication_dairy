class Admin::DairiesController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:latest]
      @dairies = Dairy.latest.page(params[:page]).per(10)
    elsif params[:old]
      @dairies = Dairy.old.page(params[:page]).per(10)
    else
      @dairies = Dairy.all.order(created_at: :desc).page(params[:page]).per(10)
   end
  end

  def show
    @dairy = Dairy.find(params[:id])
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
