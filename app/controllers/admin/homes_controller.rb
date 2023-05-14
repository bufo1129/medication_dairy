class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    medications = Medication.where(medication_status: '1')
    @medications = medications.all.order("created_at DESC").limit(5)
    # @medicines = Genre.order(:name)
  end

end
