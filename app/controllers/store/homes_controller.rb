class Store::HomesController < ApplicationController

  def top
    
    @seeds = Seed.all
    @medicines = Medicine.all
    
    # コメント新着順にならない
    @medications = Medication.find(Comment.group(:medication_id).order('created_at DESC').limit(5).pluck(:medication_id))
    
  end

  def about
  end

end
