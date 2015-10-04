class ReplyController < ApplicationController
  
  before_action :authenticate_user!
  
  def create
    idea = Idea.find(params[:id].to_i)
    
    @new_reply = Reply.create(idea: idea, user: current_user, content: params[:content])
    
    respond_to do |format|
      format.json { render json: {reply: @new_reply, user: @new_reply.user} }
    end
  end
  
  def delete
    reply = Reply.find(params[:id].to_i)
    reply.re_replies.each do |rr|
      rr.destroy
    end
    reply.destroy
    
    render nothing: true
  end
  
  def modify
    reply = Reply.find(params[:id].to_i)
    
    reply.update(content: params[:content])
    
    render nothing: true
  end
  
  def re_create
    reply = Reply.find(params[:id].to_i)
    
    @new_re_reply = ReReply.create(reply: reply, user: current_user, content: params[:content])
    
    respond_to do |format|
      format.json { render json: {re_reply: @new_re_reply, user: @new_re_reply.user} }
    end
  end
  
  def re_delete
    rr = ReReply.find(params[:id].to_i)
    rr.destroy
    
    render nothing: true
  end
  
end
