class Item < ActiveRecord::Base
  has_many :item_details
  scope :active, where(:status=>'Active')
  def Item.migrate_items
    filename = RAILS_ROOT + "/db/master_data/item_migration.csv"
    file = File.new(filename,"r")
    while (line=file.gets)
      column=line.split("$")
      @item=Item.new
      item_name=column[0].to_s.chomp.strip.squeeze("").gsub('"','')
      item=Item.find_by_name(item_name)
      if !item
      @item.name=item_name
      str=item_name.slice(0,3)
      any_prev_code=Item.find(:first, :conditions=>["item_code ilike ?",str+"%%"],:order=>"id desc")
      code=!any_prev_code.nil? ? (any_prev_code.item_code.split("-")[1].to_i + 1).to_s.rjust(3,"0") : "1".rjust(3,"0")
      item_code= str + "-" + code 
      @item.item_code=item_code
      @item.status="Active"
      status=@item.save
      else
        puts "item was already there!"
      end
      if  status
        puts "item migrated_successfully!!"
      else
        puts "not migrated!!!"
      end
    end
  end
  
  def get_current_stock
     Item.where(:id=>self.id).joins(:item_details=>:stock_detail).sum(:quantity).to_f
  end
  
  def self.get_item_code(item_name)
      str=item_name.slice(0,3)
      any_prev_code=Item.find(:first, :conditions=>["item_code ilike ?",str+"%%"],:order=>"id desc")
      code=!any_prev_code.nil? ? (any_prev_code.item_code.split("-")[1].to_i + 1).to_s.rjust(3,"0") : "1".rjust(3,"0")
      item_code= str + "-" + code 
  end
  
end
