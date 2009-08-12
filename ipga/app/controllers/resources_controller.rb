class ResourcesController < ApplicationController
  # GET /resources/1
  def show
    @resource = Resource.find(params[:id])
    @is_mine = @resource.owner_id == current_user.id
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
    @resource.owner = self.current_user
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
      flash[:notice] = '资源成功更新.'
      redirect_to(@resource)
    else
      render :action => "edit"
    end
  end

  # DELETE /resources/1
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    flash[:notice] = '资源已被删除.'
    redirect_to(mine_resources_path)
  end

  # GET /resources/search
  def search
    render :text => '请输入查询条件' and return if params[:keyword].blank?
    name = "#{I18n.locale}_name"
    @results = Resource.all(:include => [:location, :industry, :department, :level, :official_grade],
                            :conditions => ["owner_id != :self_id AND (locations.#{name} like :k OR industries.name like :k OR departments.name like :k OR
                            levels.name like :k OR official_grades.name like :k)", {:self_id => current_user.id, :k => "%#{params[:keyword]}%"}])
    if @results.blank?
      render :text => '找不到您要的结果'
    else
      render :partial => 'list', :locals => {:resources => @results, :is_mine => false}
    end
  end

  def mine
    @resources = Resource.paginate_by_owner_id current_user.id, :page => params[:page], :order => 'created_at DESC', :per_page => 5
  end
end
