class AddTitleToDairies < ActiveRecord::Migration[6.1]
  def change
    add_column :dairies, :title, :string, null: false
  end
end
