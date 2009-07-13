class MessagesController < ApplicationController
  def new
    @message = Message.new
    @resource_id = params[:resource_id]
    render_greybox
  end

  def create
    @message = Message.new(:request => Request.new(:resource => Resource.find(params[:resource_id]), :sender => current_user))
    @message.attributes = params[:message]
    if @message.save
      render :text => '发送成功'
    else
      render_greybox :action => :new
    end
  end


end
