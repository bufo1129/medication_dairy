class Store::HomesController < ApplicationController

  def top
    @individuals = Individual.all.page(params[:page]).per(10)
    @seeds = Seed.all.page(params[:page]).per(10)
    @medications = Medication.all.page(params[:page]).per(10)
    @medicines = Medicine.all.page(params[:page]).per(10)
    @dairies = Dairy.all
  end

  def about
  end

end
