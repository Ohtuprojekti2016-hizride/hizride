class SessionsController < ApplicationController
  def new
    # renderöi kirjautumissivun
  end

  def create
    # haetaan facebookin antamaa id:tä vastaava käyttäjä tietokannasta
    user = User.find_by facebook_id: params[:facebook_id]
    # jos id:tä vastaavaa käyttäjää ei ole tietokannassa, luodaan uusi käyttäjäolio
    if user.nil?
      user = User.create facebook_id: params[:facebook_id]
    end
    # talletetaan käyttäjä sessioon
    session[:user_id] = user.id
    user.last_login = Time.now # päivittää viimeisimmän kirjautumisen ajankohdan
    user.save
    redirect_to user
  end

  def destroy
    # käyttäjä kirjautuu ulos / ei ole enää aktiivinen?
    session[:user_id] = nil
  end
end