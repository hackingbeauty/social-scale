class AuthenticationsController < ApplicationController
  
  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth["provider"],omniauth["uid"])
    if authentication
      flash[:notice] = "Signed in successfully"
      redirect_to notes_path
    else
      user = User.new
      user.authentications.build(:provider => omniauth["provider"], :uid => omniauth["uid"])
      user.name = omniauth["user_info"]["name"]
      user.save!
      redirect_to notes_path
    end
    session[:name] = omniauth["user_info"]["name"]
    session[:uid] = omniauth["uid"]
    session[:provider] = omniauth["provider"]
    session[:avatar] = omniauth["user_info"]["image"]
  end

  def index
  end

  def destroy
  end

end
