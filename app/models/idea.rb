class Idea < ActiveRecord::Base
  
  has_many :idea_users
  has_many :users, through: :idea_users
  
  has_many :photos
  
  has_many :view_counters
  
  has_many :replies
  has_many :re_replies
  
  def set_view_count
    result = []
    self.view_counters.each do |item|
      result << item.ip_address
    end
    self.view = result.uniq.count
  end
  
  def favor(curr_user)
    relation = IdeaUser.where(idea: self, user: curr_user).take
    if relation
      relation.update(favorite: !relation.favorite)
    else
      relation = IdeaUser.create(idea: self, user: curr_user, favorite: true)
    end
    return relation.favorite
  end
  
  def enlike(curr_user)
    relation = IdeaUser.where(idea: self, user: curr_user).take
    if relation
      relation.update(like: !relation.like)
    else
      relation = IdeaUser.create(idea: self, user: curr_user, like: true)
    end
    
    if relation.like
      self.update(like: self.like+1)
    else
      self.update(like: self.like-1)
    end
    
    return relation.like
  end
  
  def make_images(photos)
    self.photos.each do |item|
      item.destroy
    end
    photos.each do |item|
      Photo.create(idea: self, img: item)
    end
  end
  
  def favortie_users
    return self.users.where(idea_users: {favorite: true})
  end
  
  def liked_users
    return self.users.where(idea_users: {like: true})
  end
  
  def owned_users
    return self.users.where(idea_users: {owned: true})
  end
end
