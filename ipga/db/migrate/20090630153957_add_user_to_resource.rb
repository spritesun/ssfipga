class AddUserToResource < ActiveRecord::Migration
  def self.up
    change_table(:resources) do |t|
      t.references *(:user)
    end
    
    Resource.find(:all).each do |res|
      res.update_attribute(:user_id, User.first)
    end
  end

  def self.down
    change_table(:resources) do |t|
      t.remove_references *(:user)
    end
  end
end
