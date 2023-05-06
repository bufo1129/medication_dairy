class Store::IndividualsController < ApplicationController
  before_action :authenticate_store!

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
      render :new
    end
  end

  def show
    @individual = Individual.find(params[:id])
    @seed = Seed.find_by(id: @individual.seed_id)
    #↑動物種のidを文字で表儒するため
  end

  def edit
    @individual = Individual.find(params[:id])
  end

  def update
    @individual = Individual.find(params[:id])
    if @individual.update(individual_params)
      flash[:notice] = "変更が完了しました"
      redirect_to individuals_path
    else
      render :edit
    end
  end

  def destroy
    @individual = Individual.find(params[:id])
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

  def individual_params
    params.require(:individual).permit(
      :seed_id, :name, :birthday, :age, :weight, :store_id
      )
  end

end
