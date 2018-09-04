class ApplicationController < ActionController::Base
  #flashの表示。ここでで指定したキーがredirect時のflashで使えるようになる
  add_flash_types :success, :info, :warning, :danger

  before_action :current_user
  before_action :require_sign_in!
  helper_method :signed_in?

  protect_from_forgery with: :exception

  # ----------------------------------------------------------------------------
  # ----------------------------------------------------------------------------
  def current_user
    remember_token = User.encrypt(cookies[:user_remember_token])    # cookieからトークンを取得後暗号化し、
    @current_user ||= User.find_by(remember_token: remember_token)  # cookieと同じトークンを持ったuserを取得する
      # 取得できなかった場合はログインしていない、と判断します。
  end

  # ログイン時、パスワード検証で呼び出される====================================
      # remember_tokenはログインしているかどうかの検証にも使う
  def sign_in(user)
    remember_token = User.new_remember_token         #new_remember_token: user modelで定義
    cookies.permanent[:user_remember_token] = remember_token    # remember_tokenを作成しcookieにセット
    user.update!(remember_token: User.encrypt(remember_token))  # remember_tokenをuserモデルにもセット
    @current_user = user
  end

  # ログアウト cookieの中身のremember_tokenを情報を消す ========================
  def sign_out
    @current_user = nil
    cookies.delete(:user_remember_token)
  end

  # ログインしているかを判定するメソッド =======================================
  def signed_in?
    @current_user.present?
  end


  # ----------------------------------------------------------------------------
  # Private Methods
  # ----------------------------------------------------------------------------
  private
    def require_sign_in!
      redirect_to login_path unless signed_in?
    end

end
