class User < ActiveRecord::Base
  has_one :current_location
  has_one :route

end
