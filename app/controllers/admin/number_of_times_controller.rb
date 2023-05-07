class Admin::NumberOfTimesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @number_of_time = NumberOfTime.new
    @number_of_times = NumberOfTime.all
  end

  def create
    @number_of_time = NumberOfTime.new(number_of_time_params)
    if @number_of_time.save
      flash[:notice] = "登録が完了しました"
      redirect_to admin_number_of_times_path
    else
      flash[:alert] = "失敗しました"
      @number_of_times.all
      render :index
    end
  end

  def edit
     @number_of_time =  NumberOfTime.find(params[:id])
  end

  def update
    @number_of_time =  NumberOfTime.find(params[:id])
    if @number_of_time.update(number_of_time_params)
      flash[:notice] = "変更が完了しました"
      redirect_to admin_number_of_times_path
    else
      flash[:alert] = "失敗しました"
      render :edit
    end
  end
  
  def destroy
    @number_of_time =  NumberOfTime.find(params[:id])
    @number_of_time.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_number_of_times_path
  end

  private

  def number_of_time_params
    params.require(:number_of_time).permit(:name, :dosing_times)
  end

end
