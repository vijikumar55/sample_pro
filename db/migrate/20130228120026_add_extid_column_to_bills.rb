class AddExtidColumnToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :extid, :string
  end

  def self.down
    remove_column :bills, :extid
  end
end
