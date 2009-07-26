class RequestsController < ApplicationController
  # GET /requests
  def index
    @requests = current_user.requests
  end

  # GET /requests/1
  def show
    @request = Request.find(params[:id])
    @message = Message.new(:request => @request)
  end

  def reply
    @message = Message.new(params[:message])
    @message.sender = current_user
    if @message.save
      render :partial => 'list', :locals => {:messages => @message.request.messages}
    else
      render :text => '回复失败'
    end
  end

end
