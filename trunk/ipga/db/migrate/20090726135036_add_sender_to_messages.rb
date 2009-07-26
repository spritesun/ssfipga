class AddSenderToMessages < ActiveRecord::Migration
  def self.up
    change_table :messages do |t|
      t.references :sender
    end

    Message.all.each do |message|
      message.sender = message.request.sender
      message.save
    end

  end

  def self.down
    change_table :messages do |t|
      t.remove_references :sender
    end
  end
end
