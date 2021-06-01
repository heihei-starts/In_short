class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #----------エラー処理自作（管理者権限）------------------------------
  #rescue_from User::NotAuthorized, with: :user_not_authorized

  #private
   # def user_not_authorized
      #redirect_back(fallback_location: root_path)
  #  end
  #------------------------------------------------------------

end
