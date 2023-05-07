class Admin::MedicinesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @medicine = Medicine.new
    @medicines = Medicine.all
  end

  def create
    @medicine = Medicine.new(medicine_params)
    if @medicine.save
      redirect_to admin_medicines_path
    else
      @medicines = Medicine.all
      render :index
    end
  end

  def edit
    @medicine = Medicine.find(params[:id])
  end

  def update
    @medicine = Medicine.find(params[:id])
    if @medicine.update(medicine_params)
      flash[:notice] = "変更が完了しました"
      redirect_to admin_medicines_path
    else
      render :edit
    end
  end

  def destroy
    @medicine = Medicine.find(params[:id])
    @medicine.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_medicines_path
  end

  private

  def medicine_params
    params.require(:medicine).permit(:name, :ingredients_per_tablet)
  end

end
