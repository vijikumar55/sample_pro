class ToRenameChatTableToColumn < ActiveRecord::Migration
  def self.up
    remove_column :chats, :to
    add_column :chats, :to_id ,:integer
  end

  def self.down
    add_column :chats, :to ,:integer
    remove_column :chats, :to_id
  end
end
