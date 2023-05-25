class Store::MedicationsController < ApplicationController
  before_action :authenticate_store!
  before_action :set_medication, only: [:show, :edit, :update, :destroy]

  def index
    #薬ジャンル検索
    @medicines = Medicine.all
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
    #お気に入り一覧表示
    favorites = Favorite.where(store_id: current_store.id).pluck(:medication_id)
    @favorite_list = Medication.find(favorites)

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
