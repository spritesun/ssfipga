class Resource < ActiveRecord::Base
  belongs_to :location
  belongs_to :strength
  belongs_to :department
  belongs_to :level
  belongs_to :official_grade
  belongs_to :industry
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"

  validates_presence_of :location, :strength, :department, :level, :official_grade, :industry

  has_many :requests

  validates_presence_of :owner
end
