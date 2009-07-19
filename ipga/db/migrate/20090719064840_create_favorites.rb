class CreateFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.references :user
    end

    User.all.each { |user| user.create_favorite }

    create_table :favorites_resources do |t|
      t.references :favorite
      t.references :resource
      t.timestamp
    end
  end

  def self.down
    drop_table :favorites_resources
    drop_table :favorites
  end
end
