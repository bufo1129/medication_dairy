class Store::MedicationsController < ApplicationController
  before_action :authenticate_store!

  def index
    @medications = Medication.all
  end

  def new
    @Medication = Medication.new
  end

  def create
    @mecication = Medication.new(medication_params)
  end

  def show
  end

  def edit
  end

  private

  def medication_params
    params.require(:medication).permit(

      :individual_id,:number_of_tablets, :dosing_times,
      :liquid_amount, :dosing_start_date, :dosing_end_date,
      :medication_status, :body, :store_id, :seed_id
      )
  end

end
