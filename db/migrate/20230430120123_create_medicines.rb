class CreateMedicines < ActiveRecord::Migration[6.1]
  def change
    create_table :medicines do |t|

      t.string :name,                     null: false
      t.decimal :ingredients_per_tablet,  null: false, precision: 10, scale: 5

      t.timestamps
    end
  end
end
