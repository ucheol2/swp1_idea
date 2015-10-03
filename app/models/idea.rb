class Idea < ActiveRecord::Base
  belongs_to :user
  
  has_many :photos
  
  # accepts_nested_attributes_for :images, :allow_destroy => true
end
