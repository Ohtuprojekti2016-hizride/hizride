class User < ActiveRecord::Base
  has_one :current_location
  has_one :route

  def update_last_login
    self.last_login = Time.now # päivittää viimeisimmän kirjautumisen ajankohdan
  end

  def set_route(route)
    if self.route.nil?
      self.route = Route.new(:user_id => self.id)
      self.route.save
    end
    self.route.update(:route => route)


    #@user.set_route(data)
    #@user.route.update(:route => data)
  end

  def set_current_location(lat, lng)
    if self.current_location.nil?
      self.current_location = CurrentLocation.new(:user_id => self.id)
      self.current_location.save
    end
    self.current_location.update(:lat => lat, :lng => lng)
  end
end
