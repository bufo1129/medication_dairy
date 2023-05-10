class CreateMedications < ActiveRecord::Migration[6.1]
  def change
    create_table :medications do |t|

      t.integer   :individual_id,       null: false
      t.integer   :seed_id
      t.integer   :store_id
      t.decimal   :number_of_tablets
      t.decimal   :liquid_amount
      t.date      :dosing_start_date
      t.date      :dosing_end_date
      t.boolean   :medication_status
      t.text      :body
      t.decimal   :give_liquid
      t.integer   :several_days
      t.integer   :number_of_time_id
      t.decimal   :weight

      t.timestamps
    end
  end
end
