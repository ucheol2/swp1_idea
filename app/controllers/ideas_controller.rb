class IdeasController < ApplicationController
  
  before_action :authenticate_user!, except: [:board]
  
  def board
    @ideas = Idea.all.reverse
  end

  def detail
    @idea = Idea.find(params[:id].to_i)
    
    ViewCounter.create(idea: @idea, ip_address: request.remote_ip)
    
    @idea.set_view_count
    
    @liked = @idea.users.where()
    
    @reply = Reply.new
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
    
    if params[:idea][:images]
      idea.make_images(params[:idea][:images])
    end
    redirect_to "/ideas/board"
  end
  
  def edit
    @idea = Idea.find(params[:id].to_i)
  end
  
  def modify
    idea = Idea.find(params[:id].to_i)
    idea.update(name: params[:idea][:name], password: params[:idea][:password], summary: params[:idea][:summary], description: params[:idea][:description])
    
    if params[:idea][:images]
      idea.make_images(params[:idea][:images])
    end
    
    redirect_to "/ideas/detail/#{idea.id}"
  end
  
end