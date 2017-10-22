class AddLastSeenToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :last_seen, :date
  end
end
