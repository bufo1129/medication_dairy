class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :store_id
      t.integer :medication_id
      t.text    :comment

      t.timestamps
    end
  end
end
