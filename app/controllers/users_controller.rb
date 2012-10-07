class UsersController < ApplicationController
  def show
    authentication = Authentication.find_by_uid(session[:uid])
    @user = User.find_by_id(authentication[:user_id])
    flash[:notice] = "Signed in successfully"

    debugger
    if @user.qrcode.nil?
      @qr = RQRCode::QRCode.new(@user.email, :size => 4, :level => :h )

      @user.qrcode = Qrcode.create(:path => @qr.to_s)
    end
    
    respond_to do |format|
      format.html {  }
      format.svg { render :qrcode => @user.email, :level => :l, :unit => 10 }
      format.png { render :qrcode => @user.email }
    end
  end

end
