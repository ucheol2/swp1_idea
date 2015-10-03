class Idea < ActiveRecord::Base
  
  has_many :idea_users
  has_many :users, through: :idea_users
  
  has_many :photos
  
  # accepts_nested_attributes_for :images, :allow_destroy => true
end
