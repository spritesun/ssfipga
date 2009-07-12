class Message < ActiveRecord::Base
  belongs_to :request

  validates_presence_of :title
  validates_presence_of :body

  def resource
    request.resource
  end
end
