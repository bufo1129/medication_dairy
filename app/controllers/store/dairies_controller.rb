class Store::DairiesController < ApplicationController

  def new
    @store = current_store
    @dairy = Dairy.new
  end

  def create
    @dairy = Dairy.new(dairy_params)
    @dairy.store_id = current_store.id
    @dairy.save
    redirect_to dairies_path
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def dairy_params
    params.require(:dairy).permit(:medication_id, :store_id, :weather, :high_temperature, :low_temperature, :body)
  end

end
