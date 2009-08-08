class ChangeReadToReadedMessages < ActiveRecord::Migration
  def self.up
    change_table :messages do |t|
      t.rename :read, :readed
    end
  end

  def self.down
    change_table :messages do |t|
      t.rename :readed, :read
    end
  end
end
