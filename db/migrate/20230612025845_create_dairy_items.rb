class CreateDairyItems < ActiveRecord::Migration[6.1]
  def change
    create_table :dairy_items do |t|
      t.references :dairy, foreign_key: true
      t.string :title,  null: false
      t.string :body,   null: false

      t.timestamps
    end
  end
end
