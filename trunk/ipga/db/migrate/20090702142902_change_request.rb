class ChangeRequest < ActiveRecord::Migration
  def self.up
    change_table :requests do |t|
      t.remove_belongs_to :receiver
    end

    change_table :resources do |t|
      t.rename :user_id, :owner_id
    end
  end

  def self.down
    change_table :requests do |t|
      t.belongs_to :receiver
    end
    Request.find(:all).each do |request|
      Request.update(request.id, :receiver => request.resource.user)
    end

    change_table :resources do |t|
      t.rename :owner, :user
    end
  end
end
