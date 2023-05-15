class Admin::IndividualsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @individuals = Individual.all.page(params[:page]).per(10)
  end

  def show
    @individual = Individual.find(params[:id])
  end

  private

  def individual_params
    params.require(:individual).permit(
      :seed_id, :name, :birthday, :age, :weight, :store_id, :image)
  end
end
