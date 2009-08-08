class AddReceiverToMessages < ActiveRecord::Migration
  def self.up
    change_table :messages do |t|
      t.references :receiver
    end

    Message.all.each do |message|
      message.receiver = message.request.sender == message.sender ? message.request.receiver : message.request.sender
      message.save
    end
  end

  def self.down
    change_table :messages do |t|
      t.remove_references :receiver
    end
  end
end
