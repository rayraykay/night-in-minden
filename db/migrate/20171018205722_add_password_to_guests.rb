class AddPasswordToGuests < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :password_digest, :string
  end
end
