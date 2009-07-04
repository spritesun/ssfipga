class RequestsController < ApplicationController
  # GET /requests
  def index
    #@requests = Request.find(~~~~)
    @requests = Request.all
    #TODO: 如何三个表关联查询?
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
