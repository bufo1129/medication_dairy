class Store::MedicinesController < ApplicationController
  before_action :authenticate_store!

  def show
    @medicine = Medicine.find(params[:id])
    @medicines = Medicine.all
  end

end