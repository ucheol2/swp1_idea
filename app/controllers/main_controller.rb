class MainController < ApplicationController
  def index
    @claim = Claim.new
  end
  
  def claim
    Claim.create(content: params[:claim][:content])
    redirect_to :back
  end
end
