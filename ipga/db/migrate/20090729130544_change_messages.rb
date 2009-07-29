class ChangeMessages < ActiveRecord::Migration
  def self.up
    change_table :messages do |t|
      t.boolean :read
      t.timestamps
    end

    Message.reset_column_information

    Message.all.each do |message|
      message.update_attributes :created_at => Time.now
    end
  end

  def self.down
    change_table :messages do |t|
      t.remove :read
      t.remove_timestamps
    end
  end
end
