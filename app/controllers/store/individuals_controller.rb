class Store::IndividualsController < ApplicationController
  before_action :authenticate_store!
  before_action :set_individual, only: [:show, :edit, :update, :destroy]

  def index
    @individuals_all = Individual.all
    @seeds = Seed.all
    if params[:seed_id]
      @seed = Seed.find(params[:seed_id])
      @individuals = @seed.individuals.page(params[:page]).per(8).reverse_order
      @individuals_all = @seed.individuals.all
    else
      @individuals = Individual.all.page(params[:page]).per(8).reverse_order
    end
  end

  def new
    @individual = Individual.new
  end

  def create
    @individual = Individual.new(individual_params)
    @individual.store = current_store
    if @individual.save
      flash[:notice] = "登録が完了しました"
      redirect_to individual_path(@individual)
    else
      flash[:alert] = "必須項目が選択または入力されていません"
      render :new
    end
  end

  def show
    #動物種のidを文字で表儒するため
    @seed = Seed.find_by(id: @individual.seed_id)
  end

  def edit
  end

  def update
    if @individual.update(individual_params)
      flash[:notice] = "更新が完了しました"
      redirect_to individual_path(@individual)
    else
      flash[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    if @individual.store != current_store
      flash[:alert] = "自店のみしか削除できません"
      redirect_to request.referer
    else
      @individual.destroy
      flash[:notice] = "削除しました"
      redirect_to individuals_path
    end
  end

  private

  def set_individual
    @individual = Individual.find(params[:id])
  end

  def individual_params
    params.require(:individual).permit(
      :seed_id, :name, :birthday, :age, :weight, :store_id, :image
      )
  end

end
