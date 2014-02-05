class BillingController < ApplicationController
  layout 'main_menu'
  
  def billing
    @items=Item.joins(:item_details=>:stock_detail).where("stock_details.quantity > 0").uniq
    @from="bill"
  end
  
  def add_bill_detail
    @item=Item.find_by_name(params[:name])
    @index=params[:index].to_i
    ordered_qty=params[:qty].to_f
    @item_details=ItemDetail.new(:item_id=>@item.id,:cost_price=>@item.item_details.first.cost_price)
    @bill_details=BillDetail.new(:quantity=>ordered_qty)
    render :layout=>false
  end
  
  def load_quantity
    @item=Item.find_by_name(params[:name])
    @current_stock=@item.get_current_stock
    render :layout=>false
  end
  
  def save
    ActiveRecord::Base.transaction do
      @bill=Bill.new(:total_amount=>params[:bill][:total_amount],:bill_date=>Date.today,:status=>'Active',:extid=>Bill.get_extid_for_bill)
      status=@bill.save
      for k  in params[:bill_details].keys
        @item=Item.find_by_item_code(params[:bill_details][k][:item_code])
        @item_detail=ItemDetail.find(params[:item_details][k][:batch_number].to_i)
        quantity=params[:bill_details][k][:quantity].to_f
        cost_price=params[:item_details][k][:cost_price].to_f
        bill_detail=BillDetail.new(:bill_id=>@bill.id,:narration=>@item.name,:amount=>(quantity * cost_price),:unit_price=>cost_price,:item_detail_id=>@item_detail.id,:quantity=>quantity)
        status= bill_detail.save
        status= @item_detail.stock_detail.update_stock_detail(quantity)
      end
    end
    if  status
      flash[:noice]="Bill Save Successfully! And bill number is #{@bill.extid}"
      redirect_to :action=>'view_bill', :bill_id=>@bill.id
    else
      flash[:notice]="Not saved"
      render :action=>'billing'
    end
  end
  
  def view_bill
    @bill=Bill.find(params[:bill_id].to_i)
  end
  
  def reconsilation
    @items = Item.active
  end
  
  def edit_reconsilation
    @item=Item.find(params[:item][:name])
    render :layout=>false
  end
  
  def add_batch
    @index=params[:index]
    render :layout=>false
  end
  
   def save_reconsilation
    @item=Item.find(params[:item][:id])
    for k in params[:item_details].keys
      ActiveRecord::Base.transaction do
        item_detail_hash=params[:item_details][k].merge({:item_id=>@item.id,:status=>'Active'}).delete_if{|key,value|key=="quantity"}
        status=item_detail=ItemDetail.create(item_detail_hash)
        status=stock_details=StockDetail.create(:quantity=>params[:item_details][k][:quantity],:item_detail_id=>item_detail.id)
      end
    end
    if status
      flash[:noice]="Reconsilation done successfully"
      redirect_to :action=>'reconsilation'
    end
  end
  
  def search_for_return_bill
    @bills=Bill.active
  end
  
  def return_bill
    @bill=Bill.find_by_extid(params[:bill][:no].to_s)
  end
  
  def save_return_bill
    @item=Item.find_by_item_code(params[:item][:code].to_s)
    for k in params[:item].keys
      ActiveRecord::Base.transaction do
        old_bill_detail=BillDetail.find(k.to_i)
        quantity=params[:bill_details][k][:quantity]
        new_bill_detail=BillDetail.new(:bill_id=>old_bill_detail.bill_id,:narration=>old_bill_detail.narration.to_s + "_Reversal",:quantity=>quantity, :unit_price=>old_bill_detail.unit_price, :amount=>(quantity.to_f * old_bill_detail.unit_price.to_f) ,:item_detail_id=>old_bill_detail.item_detail_id,:reference1=>old_bill_detail.id)
        status=new_bill_detail.save
        stock_detail=old_bill_detail.item_detail.stock_detail
        status= stock_detail.update_stock_detail(quantity.to_f,"return_bill")
      end
    end
    if  status
      flash[:notice]="Returning bill is done successfully!"
      redirect_to :action=>'search_for_return_bill'
    else
      render :action=>'return_bill'
    end
  end
  
  def update_existing_stock
    item_detail=ItemDetail.find(params[:detail_id].to_i)
    @status= item_detail.stock_detail.update_attributes(:quantity=>params[:quantity])
  end
  
end
