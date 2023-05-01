class CreateMedicines < ActiveRecord::Migration[6.1]
  def change
    create_table :medicines do |t|

      t.string :name, null: false

      t.timestamps
    end
  end
end
