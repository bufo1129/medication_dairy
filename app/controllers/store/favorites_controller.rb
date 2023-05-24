class Store::FavoritesController < ApplicationController
  before_action :authenticate_store!

  def create
    # @medicines = Medicine.all
    @medication_favorite = Favorite.new(store_id: current_store.id, medication_id: params[:medication_id])
    @medication_favorite.save
    redirect_to medications_path(params[:medication_id])
  end

  def destroy
    # @medicines = Medicine.all
    @medication_favorite = Favorite.find_by(store_id: current_store.id, medication_id: params[:medication_id])
    @medication_favorite.destroy
    redirect_to medications_path(params[:medication_id])
  end

end
