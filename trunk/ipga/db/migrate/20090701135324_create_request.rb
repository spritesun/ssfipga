class CreateRequest < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.belongs_to :sender
      t.belongs_to :receiver
      t.references :resource
      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
