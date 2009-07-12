class MessagesController < ApplicationController
  def new
    @message = Message.new(:request => Request.new(:resource => Resource.find(params[:resource_id])))
    render_greybox
  end
end
