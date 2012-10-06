class UsersController < ApplicationController
  def show
    authentication = Authentication.find_by_uid(session[:uid])
    @user = User.find_by_id(authentication[:user_id])
    flash[:notice] = "Signed in successfully"
      
    # qr_bits = RQRCode::QRCode.new(@user.email, :size => 4, :level => :h )
    qr_bits = "123bits"
    qr_code = Qrcode.create(:path => qr_bits)
    
    debugger
    
    @user.qrcode = qr_code
    
    respond_to do |format|
      format.html {  }
      format.svg { render :qrcode => @user.email, :level => :l, :unit => 10 }
      format.png { render :qrcode => @user.email }
    end
  end

end
