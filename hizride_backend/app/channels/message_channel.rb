# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MessageChannel < ApplicationCable::Channel
  def subscribed
    @params = params
    # stream_from "some_channel"

    # katsotaan, onko käyttäjä jo lisätty tietokantaan.
    # ellei, niin lisätään se
    if (User.find_by(facebook_id: params['user'])).nil?
      @user = User.new(:facebook_id => params['user'])
      @user.save
    else
      @user = User.find_by(facebook_id: params['user'])
      @user.update_last_login # päivittää viimeisimmän kirjautumisen ajankohdan
    end

    stream_for @user

    logger.info ">>> Subscribed #{@params}!"
    logger.info "USER>> #{@user.id}"
  end

  def unsubscribed
    @params = params
    logger.info ">>> Unsubscribed #{@params}!"
  end

  def message(data)
    logger.info "DATA>> #{data["message"]}"
  end

  def setUserLocation(location)
    logger.info "USER LOCATION>> #{data["location"]}"
  end

  def set_route(data)
    route = data['data']
    decodedRoute = Polylines::Decoder.decode_polyline(route)
    #logger.info "ROUTE>> #{decodedRoute}"

    @user = User.find_by(facebook_id: params['user'])
    @user.set_route(decodedRoute)

    send_hikers_to_driver
  end

  def set_current_location(data)
    @user = User.find_by(facebook_id: params['user'])
    logger.info "CURRENT LOCATION>> #{data}"

    coordinates = data['data']
    lat = coordinates['lat']
    lng = coordinates['lng']

    @user.set_current_location(lat, lng)
  end

  def send_hikers_to_driver
    @hikers = User.where(role: :hiker)
    @hikers_close_to_route = Array.new
    @user = User.find_by(facebook_id: params['user'])

    @hikers.each do |hiker|
      if hiker.close_to_route(@user.route)
        @hikers_close_to_route.push(hiker)
      end
    end

    @hikerlist = @hikers_close_to_route.map do |hiker| {
      :facebook_id => hiker.facebook_id,
      :current_location_lat => hiker.current_location.lat,
      :current_location_lng => hiker.current_location.lng
      }
    end

    json = @hikerlist.to_json

    MessageChannel.broadcast_to(
      @user,
      @hikerlist
    )
  end

end
