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
    @resource.user = self.current_user
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

  # GET /resources/search
  def search
    render :text => '请输入查询条件' and return if params[:keyword].blank?
    @results = Resource.all(:include => [:location, :industry, :department, :level, :official_grade],
                            :conditions => ['locations.name like :k OR industries.name like :k OR departments.name like :k OR
                            levels.name like :k OR official_grades.name like :k', {:k => "%#{params[:keyword]}%"}])
    if @results.blank?
      render :text => '找不到您要的结果'
    else
      render :partial => 'list', :locals => {:resources => @results}
    end
  end

  def mine
    @resources = current_user.resources
  end
end
