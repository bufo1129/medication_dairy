class Admin::MedicinesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_medicine, only: [:edit, :update, :destroy]

  def index
    @medicine = Medicine.new
    @medicines = Medicine.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def create
    @medicine = Medicine.new(medicine_params)
    if @medicine.save
      flash[:notice] = "登録が完了しました"
      redirect_to admin_medicines_path
    else
      flash[:alert] = "登録に失敗しました"
      @medicines = Medicine.all.page(params[:page]).per(10)
      render :index
    end
  end

  def edit
  end

  def update
    if @medicine.update(medicine_params)
      flash[:notice] = "変更が完了しました"
      redirect_to admin_medicines_path
    else
      render :edit
    end
  end

  def destroy
    @medicine.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_medicines_path
  end

  private

  def set_medicine
    @medicine = Medicine.find(params[:id])
  end


  def medicine_params
    params.require(:medicine).permit(:name, :ingredients_per_tablet)
  end

end
