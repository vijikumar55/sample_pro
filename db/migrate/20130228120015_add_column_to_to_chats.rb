class AddColumnToToChats < ActiveRecord::Migration
  def self.up
     add_column :chats, :to ,:integer
  end

  def self.down
    remove_column :chats, :to
  end
end
