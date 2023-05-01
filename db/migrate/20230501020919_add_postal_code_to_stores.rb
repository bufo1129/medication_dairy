class AddPostalCodeToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :postal_code, :string
  end
end
