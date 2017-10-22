class ChangeNameOfGuests < ActiveRecord::Migration[5.1]
  def change
    remove_column :guests, :name
    add_column :guests, :first_name, :string
    add_column :guests, :last_name, :string
  end
end
