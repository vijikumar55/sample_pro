class StockDetail < ActiveRecord::Base
  belongs_to :item_detail
  
  
  def StockDetail.migrate_stock
    @item_detail=ItemDetail.all
    random= Random.new
    @item_detail.each do |id|
      @stock_detail=StockDetail.new
      @stock_detail.item_detail_id=id.id
      @stock_detail.quantity=random.rand(1...100).to_f
      status=@stock_detail.save
      if !status
        puts "stock details was not updated!!"
      end
    end
  end
  
  def update_stock_detail(quantity,from=nil)
      quantity = from == "return_bill" ? quantity * (1) : quantity * (-1) 
      self.update_attributes(:quantity=> self.quantity + quantity.to_f)
  end
  
end
