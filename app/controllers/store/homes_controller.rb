class Store::HomesController < ApplicationController

  def top

    @seeds = Seed.all
    @medicines = Medicine.all
    @comments = Comment.all.order(created_at: "DESC").limit(5)

  end

  def about
  end

end
