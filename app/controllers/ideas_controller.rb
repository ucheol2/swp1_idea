class IdeasController < ApplicationController
  
  before_action :authenticate_user!, except: [:board]
  
  def board
  end

  def detail
  end
  
  def new
    @idea = Idea.new
  end
  
  def create
    
    idea = Idea.create(user: current_user, name: params[:idea][:name], password: params[:idea][:password], summary: params[:idea][:summary], description: params[:idea][:description])
    
    # Image.create(idea: idea, img: params[:idea][:images])
    if params[:idea][:images]
      params[:idea][:images].each do |item|
        Photo.create(idea: idea, img: item)
      end
    end
    redirect_to "/ideas/board"
  end
  
end