class Store::IndividualsController < ApplicationController
  before_action :authenticate_store!

  def index
    @individuals = Individual.all
  end

  def new
    @individual = Individual.new
  end

  def create
    @individual = Individual.new(individual_params)
    @individual.store = current_store
    if @individual.save
      redirect_to individuals_path
    else
      render :index
    end
  end

  def show
    @individual = Individual.find(params[:id])
  end

  def edit
    @individual = Individual.find(params[:id])
  end

  def update
    @individual = Individual.find(params[:id])
    if @individual.update(individual_params)
      flash[:notice] = "変更が完了しました"
      redirect_to individuals_path
    else
      render :edit
    end
  end

  def destroy
    @individual = Individual.find(params[:id])
    @individual.destroy
    flash[:notice] = "削除しました"
    redirect_to individuals_path
  end

  private

  def individual_params
    params.require(:individual).permit(:seed_id, :name, :birthday, :age, :weight)
  end

end
