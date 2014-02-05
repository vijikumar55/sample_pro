class AddColumnReference1ToBillDetails < ActiveRecord::Migration
  def self.up
    add_column :bill_details, :reference1, :string
  end

  def self.down
    remove_column :bill_details, :reference1
  end
end
