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
      :medication_id, :individual_id,
      :dosage_indicated, :ingredients_per_tablets,
      :number_of_tablets, :dosing_times,
      :liquid_amount, :dosing_start_date, :dosing_end_date,
      :medication_status, :body, :store_id, :seed_i
      )
  end

end
