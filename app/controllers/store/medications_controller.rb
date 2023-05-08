class Store::MedicationsController < ApplicationController
  before_action :authenticate_store!
  # before_action :set_medication, only: [:show, :edit, :update, :destroy] #リファクタリング用

  def index
    if params[:store_id].present?
      @medications = Medication.where(store_id: params[:store_id])
    else
      @medications = Medication.all.order(created_at: :desc)
    end
  end

  def new
    @store = current_store
    @Medication = Medication.new
  end

  def create
    @mecication = Medication.new(medication_params)
    @medication.store_id = current_store.id
    if @medication.save!
      flash[:notice] = "投稿が完了しました"
      redirect_to medication_path(@medication)
    else
      flash[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def show
    @medication = Medication.find(params[:id])
  end

  def edit
    @medication = Medication.find(params[:id])
  end

  def update
    @medication = Medication.find(params[:id])
    if @medication.update(medication_params)
      flash[:notice] = "変更が完了しました"
      redirect_to medication_path(@medication)
    else
      flash[:alert] = "変更に失敗しました"
      render :edit
    end
  end

  def destroy
    @medication = Medication.find(params[:id])
    if @medication != current_store
      flash[:alert] = "自店のみしか削除できません"
      redirect_to request.referer
    else
      @dairy.destroy
      flash[:notice] = "削除しました"
      redirect_to medications_path
    end
  end

  private

  # リファクタリング用
  # def set_medication
  #   @medication = Medication.find(params[:id])
  # end

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
      :seed_id,
      :give_liquid,
      :several_days,
      :dosage_indicated,
      :medicine_id
      )
  end

end
