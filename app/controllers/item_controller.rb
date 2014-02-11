class ItemController < ApplicationController
  layout 'main_menu'
  def new
    render :layout=>false
  end
  
  def save
    item_code=Item.get_item_code(params[:item][:name])
    @item=Item.new(params[:item].merge({:item_code=>item_code}))
    status=@item.save
    if status
      flash[:notice]="Saved Successfully!!"
      redirect_to :action=>'list'
    end
  end
  
  def list
    @page=params[:page].to_i
    @items=Item.order("name asc").page(@page)
  end
  
  def edit
    @item=Item.find(params[:item_id])
  end
  
  def update
    @item=Item.find(params[:h_item][:id])
    status=@item.update_attributes (params[:item])
    if status
      flash[:notice]="Updated Successfully!!"
      redirect_to :action=>'list'
    end
  end
  
end
