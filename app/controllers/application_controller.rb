class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger #flashの表示。ここでで指定したキーがredirect時のflashで使えるようになる
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

end
