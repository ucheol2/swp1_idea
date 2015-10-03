class Photo < ActiveRecord::Base
  belongs_to :idea
  
  mount_uploader :img, AmazonS3Uploader
end
