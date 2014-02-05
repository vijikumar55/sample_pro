class CreateStockDetails < ActiveRecord::Migration
  def self.up
    create_table :stock_details do |t|
      t.integer :item_detail_id
      t.decimal :quantity
      t.timestamps
    end
  end

  def self.down
    drop_table :stock_details
  end
end
