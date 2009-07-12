class AddFriendlyName < ActiveRecord::Migration
  def self.up
    create_table :friendly_names do |t|
      t.string :name
    end
    change_table :requests do |t|
      t.string :sender_friendly_name
      t.string :receiver_friendly_name
    end
  end

  def self.down
    change_table :requests do |t|
      t.remove :sender_friendly_name
      t.remove :receiver_friendly_name
    end
    drop_table :friendly_names
  end
end
