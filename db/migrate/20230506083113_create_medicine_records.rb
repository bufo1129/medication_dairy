class CreateMedicineRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :medicine_records do |t|

      t.integer :medication_id,   null: false
      t.integer :medicine_id,     null: false
      t.decimal :dosage_indicated,null: false

      t.timestamps
    end
  end
end
