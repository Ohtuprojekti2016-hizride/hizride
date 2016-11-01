# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MessageChannel < ApplicationCable::Channel
  def subscribed
    @params = params
    # stream_from "some_channel"
    logger.info ">>> Subscribed #{@params}!"
  end

  def unsubscribed
    @params = params
    logger.info ">>> Unsubscribed #{@params}!"
  end

  def message(data)
    logger.info "DATA>> #{data}"
  end
end