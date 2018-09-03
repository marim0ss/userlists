class SessionsController < ApplicationController

  skip_before_action :require_sign_in!, only: [:new, :create]
    #ログインしていなかったらログイン画面に遷移させるrequire_sign_in!を実装
    #   => require_sign_in!:  application_controllerで定義

  before_action :require_sign_in!, only: [:destroy]
  before_action :set_user, only: [:create]     #create前にset_userを呼び、入力されたemailからUserを探す=>createへ


  # メール・パスワードを入力させる
  def new
  end

  # 入力された情報を検証し、cookieにログイン情報を格納する  =============================================
  def create
    if @user.authenticate(session_params[:password])      #入力されたパスワードを検証、合ってたら...
      sign_in(@user)     # 探し出されたユーザーとしてサインイン.   sin_in: application_controllerで定義
      redirect_to user_posts_path(@user), success: 'ログインしました!'
    else
      # flash.now[:danger] = t('.flash.invalid_password')
      render 'new'
    end


  end

  # ログアウトの処理
  def destroy
    sign_out    #cookieの中身のremember_tokenを削除します application_controllerで定義
    redirect_to login_path, danger: 'ログアウトしました!'
  end

  private
    def set_user
      @user = User.find_by!(email: session_params[:email])
    rescue   # 例外が発生した時の処理
      render 'new', info: '無効なメールアドレスです'    # 
    end

    # 許可するパラメータ
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
