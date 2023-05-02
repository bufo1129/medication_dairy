class AddSeedIdToIndividuals < ActiveRecord::Migration[6.1]
  def change
    add_column :individuals, :seed_id, :integer, null: false
  end
end
