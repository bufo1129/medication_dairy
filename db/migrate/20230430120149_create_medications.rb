class CreateMedications < ActiveRecord::Migration[6.1]
  def change
    create_table :medications do |t|

      t.integer   :individual_id,           null: false
      t.integer   :seed_id,                 null: false
      t.integer   :store_id,                null: false
      t.decimal   :number_of_tablets
      t.integer   :dosing_times
      t.decimal   :liquid_amount
      t.date      :dosing_start_date
      t.date      :dosing_end_date
      t.boolean   :medication_status
      t.text      :body

      t.timestamps
    end
  end
end
