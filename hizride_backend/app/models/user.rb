class User < ActiveRecord::Base

  def set_role(role)
    @role = role
  end

  def get_role
    @role
  end

  def set_current_location(location)
    @current_location = location
  end

  def get_current_location
    @current_location
  end

  def set_destination(destination)
    @destination = destination
  end

  def get_destination
    @destination
  end
end
