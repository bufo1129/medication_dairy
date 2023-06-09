class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    medications = Medication.where(medication_status: true)
    @comments = Comment.all.order(created_at: "DESC").limit(5)
  end

end
