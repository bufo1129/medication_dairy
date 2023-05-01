class CreateDairies < ActiveRecord::Migration[6.1]
  def change
    create_table :dairies do |t|

      t.integer :medication_id,       null: false
      t.integer :store_id,            null: false
      t.string :weather,              null: false
      t.integer :high_temperature,    null: false
      t.integer :low_temperature,     null: false
      t.string :body,                 null: false

      t.timestamps
    end
  end
end
