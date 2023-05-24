class Store::FavoritesController < ApplicationController
  before_action :authenticate_store!

  def create
    @medication = Medication.find(params[:medication_id])
    favorite = current_store.favorites.new(medication_id: @medication.id)
    favorite.save
    redirect_to medications_path
  end

  def destroy
    @medication = Medication.find(params[:medication_id])
    favorite = current_store.favorites.find_by(medication_id: @medication.id)
    favorite.destroy
    redirect_to medications_path
  end

end
