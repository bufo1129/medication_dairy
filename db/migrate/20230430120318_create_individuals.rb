class CreateIndividuals < ActiveRecord::Migration[6.1]
  def change
    create_table :individuals do |t|

      t.integer :store_id         
      t.integer :seed_id,           null: false
      t.string  :name,              null: false
      t.date    :birthday,          null: false
      t.decimal :age
      t.decimal :weight
      t.integer :medication_id    

      t.timestamps
    end
  end
end
