class Resource < ActiveRecord::Base
  belongs_to :location
  belongs_to :strength
  belongs_to :department
  belongs_to :level
  belongs_to :official_grade
  belongs_to :industry
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"

  has_many :requests

  validates_presence_of :owner
end
