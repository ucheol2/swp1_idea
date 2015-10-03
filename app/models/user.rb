class User < ActiveRecord::Base
  
  has_many :idea_users
  has_many :ideas, through: :idea_users
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
