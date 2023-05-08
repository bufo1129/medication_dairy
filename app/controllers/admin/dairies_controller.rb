class Admin::DairiesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @dairies = Dairy.all
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
