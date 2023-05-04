class CreateIndividuals < ActiveRecord::Migration[6.1]
  def change
    create_table :individuals do |t|

      # t.integer :animal_species_id, null: false
      t.string :name,               null: false
      t.date :birthday,             null: false
      t.integer :age
      t.integer :weight

      t.timestamps
    end
  end
end
