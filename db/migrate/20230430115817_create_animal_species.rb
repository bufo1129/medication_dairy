class CreateAnimalSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :animal_species do |t|

      t.string :name, null: false

      t.timestamps
    end
  end
end
