class CreateDairies < ActiveRecord::Migration[6.1]
  def change
    create_table :dairies do |t|

      t.integer :medication_id,       null: false
      t.integer :store_id,            null: false
      t.string :weather
      t.integer :high_temperature
      t.integer :low_temperature
      t.string :body

      t.timestamps
    end
  end
end
