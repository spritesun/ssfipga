class ResourcesController < ApplicationController
  # GET /resources
  def index
    @resources = Resource.find(:all)
  end

  # GET /resources/1
  def show
    @resource = Resource.find(params[:id])
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
  end

  # POST /resources
  def create
    @resource = Resource.new(params[:resource])

    if @resource.save
      flash[:notice] = 'Resource was successfully created.'
      redirect_to(@resource)
    else
      render :action => "new"
    end
  end

  # PUT /resources/1
  def update
    @resource = Resource.find(params[:id])

    if @resource.update_attributes(params[:resource])
      flash[:notice] = 'Resource was successfully updated.'
      redirect_to(@resource)
    else
      render :action => "edit"
    end
  end

  # DELETE /resources/1
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    redirect_to(resources_url)
  end
end
