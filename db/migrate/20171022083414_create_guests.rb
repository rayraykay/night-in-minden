class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.references :table, foreign_key: true
      t.integer :ticket
      t.text :restrictions

      t.timestamps
    end
  end
end
