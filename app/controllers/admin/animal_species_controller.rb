class Admin::AnimalSpeciesController < ApplicationController

  def index
    @animal_specy = AnimalSpecy.new
    @animal_species = AnimalSpecy.all
  end

  def create
    @animal_specy = AnimalSpecy.new(animal_species_params)
    if @animal_specy.save
      redirect_to admin_animal_species_path
    else
      @animal_species = AnimalSpecy.all
      render :index
    end
  end

  def edit
    @animal_specy = AnimalSpecy.find(params[:id])
  end

  def update
    @animal_specy = AnimalSpecy.find(params[:id])
    if @animal_specy.update(animal_species_params)
      flash[:notice] = "変更が完了しました"
      redirect_to admin_animal_species_path
    else
      render :edit
    end
  end

  def destroy
    @animal_specy = AnimalSpecy.find(params[:id])
    @animal_specy.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_animal_species_path
  end

  private

  def animal_species_params
    params.require(:animal_specy).permit(:name)
  end
end
