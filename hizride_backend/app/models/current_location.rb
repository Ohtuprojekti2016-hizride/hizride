class CurrentLocation < ActiveRecord::Base
  belongs_to :user

  def close_to_location(lat, lng)
    if ((self.lat.to_i - lat.to_i).abs < 0.001) && ((self.lng.to_i - lng.to_i).abs < 0.001)
      return true
    else
      return false
    end
  end
end
