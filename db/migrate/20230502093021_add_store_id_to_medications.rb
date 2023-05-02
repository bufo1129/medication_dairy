class AddStoreIdToMedications < ActiveRecord::Migration[6.1]
  def change
    add_column :medications, :store_id, :integer, null: false
  end
end
