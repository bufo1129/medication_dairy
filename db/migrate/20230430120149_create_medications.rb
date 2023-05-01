class CreateMedications < ActiveRecord::Migration[6.1]
  def change
    create_table :medications do |t|

      t.integer :medicine_id,             null: false
      t.integer :animal_species_id,       null: false
      t.integer :individual_id,           null: false
      t.integer :dosage_indicated,        null: false
      t.integer :ingredients_per_tablets, null: false
      t.integer :number_of_tablets,       null: false
      t.integer :dosing_times,            null: false
      t.integer :liquid_amount,           null: false
      t.datetime :dosing_start_date,      null: false
      t.datetime :dosing_end_date,        null: false
      t.boolean :medication_status,       null: false
      t.text :body,                       null: false

      t.timestamps
    end
  end
end
