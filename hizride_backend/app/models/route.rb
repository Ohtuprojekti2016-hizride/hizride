class Route < ActiveRecord::Base
  belongs_to :user

  def to_array
    array = self.route.split("], [")
    array.first["\[\["] = ""
    array.last["\]\]"] = ""
    return array
  end
end
