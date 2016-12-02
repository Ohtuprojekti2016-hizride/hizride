class User < ActiveRecord::Base
  has_one :current_location
  has_one :route

  enum role: [ :driver, :hiker ]

  def update_last_login
    self.last_login = Time.now # päivittää viimeisimmän kirjautumisen ajankohdan
  end

  def set_route(route)
    if self.route.nil?
      self.route = Route.new(:user_id => self.id)
      self.route.save
    end
    self.route.update(:route => route)
  end

  def update_role(role)
    self.role = role
    self.save
  end

  def set_current_location(lat, lng)
    if self.current_location.nil?
      self.current_location = CurrentLocation.new(:user_id => self.id)
      self.current_location.save
    end
    self.current_location.update(:lat => lat, :lng => lng)
  end

  def get_hikers
    User.where(role: :hiker)
  end

  def get_drivers
    User.where(role: :driver)
  end
end
