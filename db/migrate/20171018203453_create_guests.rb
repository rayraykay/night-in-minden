class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.integer :ticket
      t.references :table, foreign_key: true
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
