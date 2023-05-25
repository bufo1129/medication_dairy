class CreateSees < ActiveRecord::Migration[6.1]
  def change
    create_table :sees do |t|

      t.references :comment,  null: false, foreign_key: true
      t.references :store,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
