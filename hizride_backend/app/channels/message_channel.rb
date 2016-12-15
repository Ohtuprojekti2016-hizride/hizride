# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MessageChannel < ApplicationCable::Channel
  def subscribed
    @params = params
    # stream_from "some_channel"

    # valitaan käyttäjä, jolta ja jolle striimataan
    if (User.find_by(facebook_id: @params['user'])).nil?
      @user_to_stream_for = User.create(:facebook_id => @params['user'])
    else
      @user_to_stream_for = User.find_by(facebook_id: @params['user'])
    end

    stream_for @user_to_stream_for

    logger.info ">>> Subscribed #{@params}!"
  end

  def set_facebook_id(data)
    uid = data['data']

    # katsotaan, onko käyttäjä jo lisätty tietokantaan.
    # ellei, niin lisätään se
    if (User.find_by(facebook_id: uid)).nil?
      @user = User.create(:facebook_id => uid)
    else
      @user = User.find_by(facebook_id: uid)
      @user.update_last_login # päivittää viimeisimmän kirjautumisen ajankohdan
    end
  end

  def unsubscribed
    @params = params
    logger.info ">>> Unsubscribed #{@params}!"
  end

  def message(data)
    logger.info "DATA>> #{data["message"]}"
  end

  def set_name(data)
    name = data['data']
    @user.update(:name => name)
  end

  def set_role(data)
    logger.info "ROLE >> #{data}"
    role = data['data']
    @user.update_role(role)
  end

  def set_route(data)
    route = data['data']
    decodedRoute = Polylines::Decoder.decode_polyline(route)
    @user.set_route(decodedRoute)

    send_hikers_to_driver
  end

  def set_destination(data)
    place = data['data']
    name = place['name']
    lat = place['lat']
    lng = place['lng']

    @user.set_destination(name, lat, lng)
  end

  def set_current_location(data)
    coordinates = data['data']
    lat = coordinates['lat']
    lng = coordinates['lng']

    @user.set_current_location(lat, lng)
  end

  # reitin haun yhteydessä lähetetään kaikki liftarit kuski-clientille
  def send_hikers_to_driver
    @hikers = User.get_hikers

    MessageChannel.broadcast_to(
      @user_to_stream_for,
      body: @hikers
    )
  end

end
