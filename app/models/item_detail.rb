class ItemDetail < ActiveRecord::Base
  belongs_to :item
  has_one :stock_detail
  
  def ItemDetail.migrate_item_details
    @items=Item.limit(1000)
    @items.each do |i|
      random= Random.new
      @item_detail=ItemDetail.new
      @item_detail.item_id=i.id
      @item_detail.cost_price=random.rand(1...100000).to_f
      @item_detail.mrp=@item_detail.cost_price.to_f
      @item_detail.status="Active"
      @item_detail.batch_number="BATCH"+"-"+ random.rand(1...1000).to_s
      @item_detail.expiry_date="2015-04-01"
      status=@item_detail.save
      if !status
        puts "not saved for #{i.name}"
      end
    end
  end
end
