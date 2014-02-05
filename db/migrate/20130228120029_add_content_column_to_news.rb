class AddContentColumnToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :content, :text
  end

  def self.down
    remove_column :news, :content
  end
end
