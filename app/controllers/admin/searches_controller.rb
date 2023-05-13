class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @range = params[:range]

    if @range == "Store"
      @store = Store.looks(params[:search], params[:word])
    else
      @individuals = Individual.looks(params[:search], params[:word])
    end
  end
end
