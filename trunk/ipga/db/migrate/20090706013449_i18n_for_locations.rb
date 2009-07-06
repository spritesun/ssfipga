class I18nForLocations < ActiveRecord::Migration
  def self.up
    change_table :locations do |t|
      t.rename :name, :en_name
      t.string :zh_name
    end
  end

  def self.down
    change_table :locations do |t|
      t.remove :zh_name
      t.rename :en_name, :name
    end
  end
end
