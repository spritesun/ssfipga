class Resource < ActiveRecord::Base
  belongs_to :location
  belongs_to :strength
  belongs_to :department
  belongs_to :level
  belongs_to :official_grade
  belongs_to :industry
  belongs_to :user
end
