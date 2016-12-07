# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MessageChannel < ApplicationCable::Channel
  def subscribed
    @params = params
    # stream_from "some_channel"

    if (User.find_by(facebook_id: @params['user'])).nil?
      @user_to_stream_for = User.create(:facebook_id => @params['user'])
    else
      @user_to_stream_for = User.find_by(facebook_id: @params['user'])
    end

    stream_for @user_to_stream_for

    logger.info ">>> Subscribed #{@params}!"
    logger.info "USER>> #{@user_to_stream_for.id}"
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

    logger.info ">>> Subscribed #{@params}!"
    logger.info "USERID RECEIVED>> #{params['user']}"
    logger.info "USER>> #{@user.id}"
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
    logger.info "ROUTE>> #{decodedRoute}"

    #@user = User.find_by(facebook_id: params['user'])
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
    #@user = User.find_by(facebook_id: params['user'])
    logger.info "CURRENT LOCATION>> #{data}"

    coordinates = data['data']
    lat = coordinates['lat']
    lng = coordinates['lng']

    @user.set_current_location(lat, lng)
  end

  def send_hikers_to_driver
    @hikers = User.where(role: :hiker)

      @hikerlist = @hikers.map do |hiker|
        {
        :facebook_id => hiker.facebook_id,
        :destination_lat => hiker.destination_lat,
        :destination_lng => hiker.destination_lng
        }
      end

    json = @hikerlist.to_json

    MessageChannel.broadcast_to(
      @user_to_stream_for,
      body: json
    )
  end

  def get_suitable_hikers()
    User.get_hikers
  end

end
