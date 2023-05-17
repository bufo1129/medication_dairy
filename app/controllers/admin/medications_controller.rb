class Admin::MedicationsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:medicine_id].present?
      mid = MedicineRecord.where(medicine_id: params[:medicine_id]).pluck(:medication_id)
      @medications = Medication.where(id: mid).order(created_at: :desc).page(params[:page]).per(8)
    else
      @medications = Medication.all.order(created_at: :desc).page(params[:page]).per(8)
    end

    if params[:latest]
      @medications = Medication.latest.page(params[:page]).per(8)
    elsif params[:old]
      @medications = Medication.old.page(params[:page]).per(8)
    else
      @medications = Medication.all.order(created_at: :desc).page(params[:page]).per(8)
    end

    # if params[:individual_id].present?
    #   medications = Dairy.where(individual_id: params[:individual_id])
    # else
    #   medications = Dairy.all.order(created_at: :desc).page(params[:page]).per(8)
    # end
  end

  def show
    @medication = Medication.find(params[:id])
    if params[:medicine_id].present?
      mid = MedicineRecord.where(medicine_id: params[:medicine_id]).pluck(:medication_id)
      @medications = Medication.where(id: mid).order(created_at: :desc).page(params[:page]).per(8)
    else
      @medications = Medication.all.order(created_at: :desc).page(params[:page]).per(8)
    end

    @comment = Comment.new
    @comments = @medication.comments.includes(:store)

  end

  private

  def medication_params
    params.require(:medication).permit(
      :individual_id,
      :number_of_tablets,
      :liquid_amount,
      :dosing_start_date,
      :dosing_end_date,
      :medication_status,
      :body,
      :store_id,
      :give_liquid,
      :several_days,
      :medicine_record_id,
      :number_of_time_id,
      :weight,
      medicine_records_attributes: [
        :dosage_indicated,
        :medicine_id
      ])
  end

end
