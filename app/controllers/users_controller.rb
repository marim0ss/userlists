class UsersController < ApplicationController

# ユーザ登録も、新規の人が最初に行うオペレーションなので、こちらも同様にログインなしで実行できるようにしておく
  skip_before_action :require_sign_in!, only: [:new, :create, :top]

  def top

  end

  #一覧表示
  def index
    @users = User.all
    @posts = Post.all

  # データ検索ができる。commentにデータがない場合はall検索となる
    if params[:name_cont || :age_cont].present?
      user_search = UserSearch.new(params_user_search)
      @users = user_search.execute
    end
  end

  #新規作成
  def new
    @users = User.new
  end

  #新規作成完了
  def create
    #createアクションでstrong parameter のメソッドを呼び出す
    @user = User.create(users_params)

    if @user.save
      redirect_to login_path
    else
      flash.now[:danger] = t('.新規登録に失敗しました')
      render 'new'
    end
  end

  #詳細表示
  def show
    @user = User.find(params[:id])
  end

  #編集
  def edit
    # 編集するユーザーの情報を取得
    @user = User.find(params[:id])
  end


  #更新
  def update
    user = User.find(params[:id])
    user.update(users_params)
  end

  #削除
  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  #ストロングパラメータを定義
  private
    def users_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :birthplace, :image, :gender, :birth_date, :how_are_you, :programming => [])
    end
    # {:programming => []}  配列を登録できるように指定

    def params_user_search
      params.permit(:name_cont, :age_cont)
    end
end
