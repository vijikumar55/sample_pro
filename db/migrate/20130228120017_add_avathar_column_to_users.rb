class AddAvatharColumnToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :avathar ,:string
  end

  def self.down
    remove_column :users, :avathar ,:string
  end
end
