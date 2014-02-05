class CreateBillDetails < ActiveRecord::Migration
  def self.up
    create_table :bill_details do |t|
      t.integer :bill_id
      t.string  :narration
      t.decimal :amount
      t.decimal :unit_price
      t.decimal :quantity
      t.integer :item_detail_id
      t.timestamps
    end
  end

  def self.down
    drop_table :bill_details
  end
end
