class Store::IndividualsController < ApplicationController
  before_action :authenticate_store!
  before_action :set_individual, only: [:show, :edit, :update, :destroy]

  def index
    @individuals = Individual.all.order(created_at: :desc)
  end

  def new
    @individual = Individual.new
  end

  def create
    @individual = Individual.new(individual_params)
    @individual.store = current_store
    if @individual.save
      flash[:notice] = "登録が完了しました"
      redirect_to individuals_path
    else
      flash[:alert] = "必須項目が選択または入力されていません"
      render :new
    end
  end

  def show
    @seed = Seed.find_by(id: @individual.seed_id)
    #↑動物種のidを文字で表儒するため
  end

  def edit
  end

  def update
    if @individual.update(individual_params)
      flash[:notice] = "変更が完了しました"
      redirect_to individuals_path
    else
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
      :seed_id, :name, :birthday, :age, :weight, :store_id
      )
  end

end
