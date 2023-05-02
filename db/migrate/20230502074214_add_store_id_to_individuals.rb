class AddStoreIdToIndividuals < ActiveRecord::Migration[6.1]
  def change
    add_column :individuals, :store_id, :integer, null: false
  end
end
