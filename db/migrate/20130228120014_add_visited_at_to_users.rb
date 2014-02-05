class AddVisitedAtToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :visited_at ,:timestamp
  end

  def self.down
    remove_column :users, :visited_at ,:timestamp
  end
end
