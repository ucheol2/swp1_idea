class User < ActiveRecord::Base
  
  has_many :idea_users
  has_many :ideas, through: :idea_users
  
  has_many :replies
  has_many :re_replies
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def favorite_ideas
    return self.ideas.where(idea_users: {favorite: true})
  end
end
