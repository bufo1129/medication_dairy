class Admin::IndividualsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_individual, only: [:show, :edit, :update]

  def index
    @individuals = Individual.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
    if @individual.update(individual_params)
      flash[:notice] = "更新が完了しました"
      redirect_to admin_individual_path(@individual)
    else
      flash[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  private

  def set_individual
    @individual = Individual.find(params[:id])
  end

  def individual_params
    params.require(:individual).permit(
      :seed_id, :name, :birthday, :age, :weight, :store_id, :image
      )
  end
end
