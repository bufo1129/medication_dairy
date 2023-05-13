class Admin::WeathersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_weather, only: [:edit, :update, :destroy]

  def index
    @weather = Weather.new
    @weathers = Weather.all
  end

  def create
    @weather = Weather.new(seed_params)
    if @weather.save
      flash[:notice] = "変更が完了しました"
      redirect_to admin_weathers_path
    else
      flash[:alert] = "失敗しました"
      @weathers = Weather.all
      render :index
    end
  end

  def edit
  end

  def update
    if @weather.update(seed_params)
      flash[:notice] = "変更が完了しました"
      redirect_to admin_weathers_path
    else
      flash[:alert] = "失敗しました"
      render :edit
    end
  end

  def destroy
    @weather.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_weathers_path
  end

  private

  def set_weather
    @weather = Weather.find(params[:id])
  end

  def seed_params
    params.require(:weather).permit(:name)
  end

end
