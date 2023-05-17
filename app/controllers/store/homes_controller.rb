class Store::HomesController < ApplicationController

  def top
    
    @seeds = Seed.all
    @medications = Medication.all.page(params[:page]).per(5)
    @medicines = Medicine.all
    @comment
    
    # @individuals = Individual.all.page(params[:page]).per(10)
    # @dairies = Dairy.all
  end

  def about
  end

end
