class CreateAdminSees < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_sees do |t|

      t.references :comment,  null: false, foreign_key: true
      t.references :admin,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
