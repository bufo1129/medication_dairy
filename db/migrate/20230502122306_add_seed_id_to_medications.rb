class AddSeedIdToMedications < ActiveRecord::Migration[6.1]
  def change
    add_column :medications, :seed_id, :integer, null: false
  end
end
