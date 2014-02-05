class CreateItemDetails < ActiveRecord::Migration
  def self.up
    create_table :item_details do |t|
      t.integer :item_id
      t.decimal :cost_price
      t.decimal :mrp
      t.string  :batch_number
      t.string  :status
      t.string  :expiry_date
      t.timestamps
    end
  end

  def self.down
    drop_table :item_details
  end
end
