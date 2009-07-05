class RequestsController < ApplicationController
  # GET /requests
  def index
    @requests = current_user.requests
  end

  # GET /requests/create
  def create
    #@request = Request.new(params[:request])
    #
    #if @request.save
    #  flash[:notice] = 'Request was successfully created.'
    #  render :text => 'Request was successfully created.'
    #else
    #  render :text => 'Request was not successfully created.'
    #end

    @request = Request.new
    @request.sender_id= self.current_user.id
    @request.resource_id= params[:resource_id]

    if @request.save
      render :text => 'Request was successfully created.'
    else
      render :text => 'Request was not successfully created.'
    end

  end
end
