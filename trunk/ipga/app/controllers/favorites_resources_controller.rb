class FavoritesResourcesController < ApplicationController

  # POST /FavoritesResources
  def create
    @favorites_resource = FavoritesResource.create(:resource => Resource.find(params[:resource_id]), :favorite => current_user.favorite)
    render :partial => 'shared/favorite', :locals => { :favorite => current_user.favorite }
  end

  # DELETE /resources/1
  def destroy
    @favorites_resource = FavoritesResource.find(params[:id])
    @favorites_resource.destroy
    render :partial => 'shared/favorite', :locals => { :favorite => current_user.favorite }
  end
end