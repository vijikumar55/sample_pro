class BillDetail < ActiveRecord::Base
  belongs_to :bill
  belongs_to :item_detail
end
