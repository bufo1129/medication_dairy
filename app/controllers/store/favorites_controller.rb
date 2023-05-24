class Store::FavoritesController < ApplicationController
  before_action :authenticate_store!
  before_action :set_medication

  def create
    favorite = current_store.favorites.new(medication_id: @medication.id)
    favorite.save
    redirect_to medications_path
  end

  def destroy
    favorite = current_store.favorites.find_by(medication_id: @medication.id)
    favorite.destroy
    redirect_to medications_path
  end
  
  private
  
  def set_medication
    @medication = Medication.find(params[:id])
  end

end
