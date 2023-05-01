class AddPhoneNumberToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :phone_number, :string
  end
end
