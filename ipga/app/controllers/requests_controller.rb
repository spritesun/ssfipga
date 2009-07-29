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
      render :partial => 'list', :locals => {:messages => @message.request.messages.sort_by(&:created_at).reverse}
    else
      render :text => '回复失败'
    end
  end

end
