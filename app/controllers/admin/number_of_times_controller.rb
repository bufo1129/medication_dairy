class Admin::NumberOfTimesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_number_of_time, only: [:edit, :update, :destroy]

  def index
    @number_of_time = NumberOfTime.new
    @number_of_times = NumberOfTime.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def create
    @number_of_time = NumberOfTime.new(number_of_time_params)
    if @number_of_time.save
      flash[:notice] = "登録が完了しました"
      redirect_to admin_number_of_times_path
    else
      flash[:alert] = "失敗しました"
      @number_of_times = NumberOfTime.all.page(params[:page]).per(10)
      render :index
    end
  end

  def edit
  end

  def update
    if @number_of_time.update(number_of_time_params)
      flash[:notice] = "変更が完了しました"
      redirect_to admin_number_of_times_path
    else
      flash[:alert] = "失敗しました"
      render :edit
    end
  end

  def destroy
    @number_of_time.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_number_of_times_path
  end

  private

  def set_number_of_time
    @number_of_time =  NumberOfTime.find(params[:id])
  end

  def number_of_time_params
    params.require(:number_of_time).permit(:name, :dosing_times)
  end

end
