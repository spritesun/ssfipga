class Request < ActiveRecord::Base
  belongs_to :sender, :class_name => "User"
  belongs_to :resource

  validates_presence_of :sender
  validates_presence_of :resource

  def receiver
    resource.owner
  end

  def validate
    if sender.id == receiver.id
      errors.add("sender", "can not request yourself." )
    end
  end
end