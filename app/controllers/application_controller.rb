class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger #flashの表示。ここでで指定したキーがredirect時のflashで使えるようになる

  before_action :current_user
  before_action :require_sign_in!
  helper_method :signed_in?

  protect_from_forgery with: :exception


  # cookieからトークンを取得後暗号化し、cookieと同じトークンを持ったuserを取得します。
  # 取得できなかった場合はログインしていない、と判断します。
  def current_user
    remember_token = User.encrypt(cookies[:user_remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  # ログイン時、パスワード検証で呼び出される======================
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:user_remember_token] = remember_token
    user.update!(remember_token: User.encrypt(remember_token))
    @current_user = user
  end

  # ログアウトcookieの中身の情報を消す ======================
  def sign_out
    @current_user = nil
    cookies.delete(:user_remember_token)
  end

  # ログインしているかを判定するsigned_in?メソッド ==========
  def signed_in?
    @current_user.present?
  end

  private

    def require_sign_in!
      redirect_to login_path unless signed_in?
    end

end
