class FavoritesResourcesController < ApplicationController

  # POST /FavoritesResources
  def create
    @favorites_resource = FavoritesResource.create(:resource => Resource.find(params[:resource_id]), :favorite => current_user.favorite)
    render_current_user_favorite
  end

  # DELETE /resources/1
  def destroy
    @favorites_resource = FavoritesResource.find(params[:id])
    @favorites_resource.destroy
    render_current_user_favorite
  end

  private

  def render_current_user_favorite
    render :partial => 'shared/favorite', :locals => { :favorite => current_user.favorite }
  end
end