class Store::HomesController < ApplicationController

  def top
    @seeds = Seed.all
    @comments = Comment.all.order(created_at: "DESC").limit(5)
    #お気に入り一覧表示
    if store_signed_in?
      favorites = Favorite.where(store_id: current_store.id).pluck(:medication_id)
      @favorite_list = Medication.find(favorites)
    end
  end
  
  def about
  end

end
