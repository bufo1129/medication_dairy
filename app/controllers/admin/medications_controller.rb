class Admin::MedicationsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:latest]
      @medications = Medication.latest.page(params[:page]).per(10)
    elsif params[:old]
      @medications = Medication.old.page(params[:page]).per(10)
    else
      @medications = Medication.all.order(created_at: :desc).page(params[:page]).per(10)
   end
  end

  def show
    @medication = Medication.find(params[:id])
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
