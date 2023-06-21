class Store::MedicationsController < ApplicationController
  before_action :authenticate_store!
  before_action :is_matching_login_store, only: [:edit, :update]
  before_action :set_medication, only: [:show, :edit, :update, :destroy]

  def index
    @medications = Medication.filtered_medications(params)
  end

  def new
    @store = current_store
    @medication = Medication.new
    @medication.medicine_records.build
  end

  def create
    @medication = Medication.new(medication_params)
    @medication.store_id = current_store.id
    if @medication.save
      flash[:notice] = "投稿が完了しました"
      redirect_to medication_path(@medication)
    else
      flash[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def show
    @store = current_store
    @comments = @medication.comments
    @comment = current_store.comments.new
  end

  def edit
  end

  def update
    if @medication.update!(medication_params)
      flash[:notice] = "変更が完了しました"
      redirect_to medication_path(@medication)
    else
      flash[:alert] = "変更に失敗しました"
      render :edit
    end
  end

  def destroy
    if @medication.store != current_store
      flash[:alert] = "削除に失敗しました"
      redirect_to request.referer
    else
      @medication.destroy
      flash[:notice] = "削除しました"
      redirect_to medications_path
    end
  end

  private

  def is_matching_login_store
    medication = Medication.find(params[:id])
    unless medication.store_id == current_store.id
      redirect_to medications_path
    end
  end

  def set_medication
    @medication = Medication.find(params[:id])
  end

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
      :weight,
      :condition,
      medicine_records_attributes: [
        :dosage_indicated,
        :medicine_id,
        :number_of_time_id,
        :id,
        :_destroy
      ])
  end

end
