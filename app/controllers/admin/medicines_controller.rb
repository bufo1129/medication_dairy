class Admin::MedicinesController < ApplicationController
  def index
  end

  def new
    @medicine = Medicine.new
  end

  def create
    @medicine = Medicine.new(medicine_params)
    @medicine.save
      redirect_to admin_root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def medicine_params
    params.reqire(:medicine).permit(:name)
  end
  
end
