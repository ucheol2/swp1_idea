class IdeasController < ApplicationController
  
  before_action :authenticate_user!, except: [:board]
  
  def board
    @ideas = Idea.all
  end

  def detail
  end
  
  def new
    @idea = Idea.new
  end
  
  def create
    
    idea = Idea.create(name: params[:idea][:name], password: params[:idea][:password], summary: params[:idea][:summary], description: params[:idea][:description])
    
    if IdeaUser.where(idea: idea, user: current_user).take
      IdeaUser.where(idea: idea, user: current_user).take.update(owned: true)
    else
      IdeaUser.create(idea: idea, user: current_user, owned: true)
    end
    
    # Image.create(idea: idea, img: params[:idea][:images])
    if params[:idea][:images]
      params[:idea][:images].each do |item|
        Photo.create(idea: idea, img: item)
      end
    end
    redirect_to "/ideas/board"
  end
  
end