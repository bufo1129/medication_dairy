class CreateNumberOfTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :number_of_times do |t|

      t.string  :name
      t.decimal :dosing_times, precision: 5, scale: 3

      t.timestamps
    end
  end
end
