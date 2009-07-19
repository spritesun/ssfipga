class Favorite < ActiveRecord::Base
  has_many :favorites_resources
  has_and_belongs_to_many :resources
end