class CreateDairies < ActiveRecord::Migration[6.1]
  def change
    create_table  :dairies do |t|
      t.string    :title,             null: false
      t.integer   :medication_id
      t.integer   :store_id,          null: false
      t.string    :weather_id
      t.integer   :high_temperature
      t.integer   :low_temperature
      t.string    :body
      t.date      :created_date,      null: false
      t.integer   :humidity

      t.timestamps
    end
  end
end
