class Admin::SeedsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_seed, only: [:edit, :update, :destroy]

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
  end

  def update
    if @seed.update(seed_params)
      flash[:notice] = "変更が完了しました"
      redirect_to admin_seeds_path
    else
      flash[:alert] = "失敗しました"
      render :edit
    end
  end

  def destroy
    @seed.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_seeds_path
  end

  private

  def set_seed
    @seed = Seed.find(params[:id])
  end


  def seed_params
    params.require(:seed).permit(:name)
  end

end
