class Admin::MedicationsController < ApplicationController
  before_action :authenticate_admin!

  def index

      #個体の詳細からその個体の投薬一覧へ+並べ替え
    if params[:individual_id].present?
      if params[:latest]
        @medications = Medication.where(individual_id: params[:individual_id]).latest.page(params[:page]).per(8)
      elsif params[:old]
        @medications = Medication.where(individual_id: params[:individual_id]).old.page(params[:page]).per(8)
      else
         @medications = Medication.where(individual_id: params[:individual_id]).page(params[:page]).per(8)
      end
      #店舗の詳細からその店舗の投薬一覧へ+並べ替え
    elsif params[:each_store_id].present?
      if params[:latest]
        @medications = Medication.where(store_id: params[:each_store_id]).latest.page(params[:page]).per(8)
      elsif params[:old]
        @medications = Medication.where(store_id: params[:each_store_id]).old.page(params[:page]).per(8)
      else
         @medications = Medication.where(store_id: params[:each_store_id]).page(params[:page]).per(8)
      end
    else
      #投薬一覧並べ替え
      if params[:latest]
        @medications = Medication.all.latest.page(params[:page]).per(8)
      elsif params[:old]
        @medications = Medication.all.old.page(params[:page]).per(8)
      else
         @medications = Medication.all.page(params[:page]).per(8)
      end
    end

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
