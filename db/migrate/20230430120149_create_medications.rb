class CreateMedications < ActiveRecord::Migration[6.1]
  def change
    create_table :medications do |t|

      t.integer :medicine_id,             null: false
      # t.integer :animal_species_id,       null: false
      t.integer :individual_id,           null: false
      t.integer :dosage_indicated
      t.integer :ingredients_per_tablets
      t.integer :number_of_tablets
      t.integer :dosing_times
      t.integer :liquid_amount
      t.datetime :dosing_start_date
      t.datetime :dosing_end_date
      t.boolean :medication_status
      t.text :body

      t.timestamps
    end
  end
end
