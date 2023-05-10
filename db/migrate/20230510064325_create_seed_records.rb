class CreateSeedRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :seed_records do |t|
      
      t.integer :seed_id
      t.integer :medication_id
      
      t.timestamps
    end
  end
end
