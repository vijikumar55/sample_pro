class Bill < ActiveRecord::Base
  has_many :bill_details
  
  scope :active, where(:status=>'Active')
  
  def self.get_extid_for_bill
      last_bill=self.order("id desc").limit(1)
      if !last_bill.empty?
       extid=(last_bill[0].extid.split("/")[0].to_s) +"/".to_s + (last_bill[0].extid.split("/")[1].to_i + 1).to_s.rjust(6,'0')
      else
        extid="PBILL/"+"000001" 
      end
  end

end
