class Reply < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  has_many :re_replies
end
