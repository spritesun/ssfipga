class FavoritesResource < ActiveRecord::Base
  belongs_to :resource
  belongs_to :favorite
  validates_uniqueness_of :resource_id, :scope => :favorite_id
end