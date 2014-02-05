class News < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  #has_attached_file :video1,

    # :storage => :s3,
# 
    # :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
# 
    # :path => ":attachment/:id/:style/:basename.:extension",
# 
    # :bucket => 'vijikumar55'
#     
     # attr_accessor :video1_file_name
     # validates_attachment_presence :video1
end


