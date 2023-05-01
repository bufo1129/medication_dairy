class Store::MedicinesController < ApplicationController
  # 保留
  def show
    @medicine = Medicine.find(params[:id])
    @medicines = Medicine.all
  end

end