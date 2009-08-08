class Message < ActiveRecord::Base
  belongs_to :request
  belongs_to :sender, :class_name => "User"
  belongs_to :receiver, :class_name => "User"

  validates_presence_of :title
  validates_presence_of :body

  def resource
    request.resource
  end

  def body_preview
    body[0, 42] << '...'
  end
end
