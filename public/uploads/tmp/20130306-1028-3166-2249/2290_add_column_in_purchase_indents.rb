class AddColumnInPurchaseIndents < ActiveRecord::Migration
  def self.up
    add_column :purchase_indents, :is_consignment_pi, :boolean, :default => false
  end

  def self.down
    remove_column :purchase_indents, :is_consignment_pi
  end
end
