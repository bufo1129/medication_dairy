class AddGiveMedicineToDairies < ActiveRecord::Migration[6.1]
  def change
    add_column :dairies, :give_medicine, :boolean
  end
end
