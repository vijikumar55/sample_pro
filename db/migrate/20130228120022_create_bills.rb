class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.date :bill_date
      t.decimal :total_amount
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :bills
  end
end
