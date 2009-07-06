class Location < ActiveRecord::Base
  def name
    send("#{I18n.locale}_name")
  end
end
