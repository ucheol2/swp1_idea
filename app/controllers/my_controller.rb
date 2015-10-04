class MyController < ApplicationController
  
  before_action :authenticate_user!
  
  def like
    idea = Idea.find(params[:idea_id].to_i)
    
    liked = idea.enlike(current_user)
    respond_to do |format|
      format.json { render json: {liked: liked, count: idea.like} }
    end
  end
  
  def favorite
    
    idea = Idea.find(params[:idea_id].to_i)
    
    respond_to do |format|
      format.json { render json: idea.favor(current_user) }
    end
  end
  
end
