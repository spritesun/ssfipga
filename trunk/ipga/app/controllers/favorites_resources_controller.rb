class FavoritesResourcesController < ApplicationController

  # POST /FavoritesResources
  def create
    @favorites_resource = FavoritesResource.create(:resource => Resource.find(params[:resource_id]), :favorite => current_user.favorite)
    render :text => nil
  end
end