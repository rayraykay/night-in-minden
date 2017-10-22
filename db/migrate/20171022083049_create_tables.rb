class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.integer :max_capacity, default: 10

      t.timestamps
    end
  end
end
