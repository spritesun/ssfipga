class Request < ActiveRecord::Base
  belongs_to :sender, :class_name => "User"
  belongs_to :resource
  has_many :messages

  validates_presence_of :sender
  validates_presence_of :resource
  validate :ensure_sender_receiver_difference

  before_create :set_participator_name

  def receiver
    resource.owner
  end

  private

  def ensure_sender_receiver_difference
    errors.add("sender", I18n.t(:can_not_request_self)) if sender.id == receiver.id
  end

  def set_participator_name
    self.sender_friendly_name = rand_name
    self.receiver_friendly_name = rand_name
  end

  def rand_name
    FriendlyName.all.rand.name + rand(10).to_s + rand(10).to_s
  end
end