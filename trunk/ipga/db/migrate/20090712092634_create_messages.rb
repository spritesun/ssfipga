class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.references :request
    end
  end

  def self.down
    drop_table :messages
  end
end
