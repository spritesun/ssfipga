class Request < ActiveRecord::Base
  belongs_to :sender, :class_name => "User"
  belongs_to :resource

  validates_presence_of :sender
  validates_presence_of :resource
  validate :ensure_sender_receiver_difference

  def receiver
    resource.owner
  end

  private

  def ensure_sender_receiver_difference
    if sender.id == receiver.id
      errors.add("sender", t(:can_not_request_self))
    end
  end
end