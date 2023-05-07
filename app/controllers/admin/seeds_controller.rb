class Admin::SeedsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @seed = Seed.new
    @seeds = Seed.all
  end

  def create
    @seed = Seed.new(seed_params)
    if @seed.save
      flash[:notice] = "変更が完了しました"
      redirect_to admin_seeds_path
    else
      flash[:alert] = "失敗しました"
      @seeds = Seed.all
      render :index
    end
  end

  def edit
    @seed = Seed.find(params[:id])
  end

  def update
    @seed = Seed.find(params[:id])
    if @seed.update(seed_params)
      flash[:notice] = "変更が完了しました"
      redirect_to admin_seeds_path
    else
      flash[:alert] = "失敗しました"
      render :edit
    end
  end

  def destroy
    @seed = Seed.find(params[:id])
    @seed.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_seeds_path
  end

  private

  def seed_params
    params.require(:seed).permit(:name)
  end

end
