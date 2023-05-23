class CreateMedications < ActiveRecord::Migration[6.1]
  def change
    create_table :medications do |t|

      t.integer   :individual_id,       null: false
      t.integer   :seed_id
      t.integer   :store_id
      t.decimal   :number_of_tablets, precision: 7, scale: 5
      t.decimal   :liquid_amount, precision: 7, scale: 5
      t.date      :dosing_start_date
      t.date      :dosing_end_date
      t.boolean   :medication_status
      t.text      :body
      t.decimal   :give_liquid, precision: 7, scale: 5
      t.integer   :several_days
      t.decimal   :weight, precision: 7, scale: 5
      t.string    :condition
      
      t.timestamps
    end
  end
end
