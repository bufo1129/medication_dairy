class Store::SearchesController < ApplicationController
  before_action :authenticate_store!

  def search
    @range = params[:range]

    if @range == "Store"
      @stores = Store.looks(params[:search], params[:word])
    else
      @individuals = Individual.looks(params[:search], params[:word])
    end
  end
end
