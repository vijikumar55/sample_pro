class User < ActiveRecord::Base
  mount_uploader :avathar, AvatarUploader
end
