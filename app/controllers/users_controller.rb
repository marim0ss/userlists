class UsersController < ApplicationController
  # ------------------------------------------------------------------
  # ユーザ登録も、新規の人が最初に行うオペレーションなので、
    # ログインなしで実行できるようにしておく
  # ------------------------------------------------------------------
  skip_before_action :require_sign_in!, only: [:new, :create, :top]

  # edit, update,destroyを正しいユーザーが操作するように保護
  before_action :correct_user, only: [:edit, :update, :destroy]

  # ------------------------------------------------------------------
  # ------------------------------------------------------------------
  def top

  end

  #一覧表示
  def index
    @users = User.paginate(:page => params[:page], :per_page => 30)
    @posts = Post.all

  # データ検索ができる。commentにデータがない場合はall検索となる
    if params[:name_cont].present? || params[:age_eq].present?
      user_search = UserSearch.new(params_user_search)
      @users = user_search.execute
    end
  end

  #新規作成
  def new
    @user = User.new
  end

  #新規作成完了
  def create
    #createアクションでstrong parameter のメソッドを呼び出す
    @user = User.create(users_params)

    if @user.save
      sign_in(@user)    # 新規登録と同時にサインインさせる
      redirect_to user_path(@user), success: '新規登録しました!「新規投稿する」から投稿してみましょう!'
    else
      # flash.now[:danger] = "" => フラッシュはビューからshared/error_messages.html.erbを呼び出し
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
      # ↓この処理はcorrect_userが行っているので省略する
    # @user = User.find(params[:id])
  end


  #更新
  def update
    # ↓この処理はcorrect_userが行っているので省略する
    # user = User.find(params[:id])
    @user.update(users_params)
    redirect_to user_path(@user), success: 'プロフィールを更新しました'
  end

  #削除
  def destroy
    # ↓この処理はcorrect_userが行っているので省略する
    # user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_path, danger: 'ユーザーを削除しました'
  end


  private
    # ------------------------------------------------------------------
      #ストロングパラメータを定義
    # ------------------------------------------------------------------
    def users_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :birthplace, :image, :gender, :birth_date, :how_are_you, :programming => [])
    end
    # ------------------------------------------------------------------
      # {:programming => []}  配列を登録できるように指定
      # マイグレーションファイルで:textにしたところは、herokuにあげる時だけ
      # change_column :users, :programming, 'text USING CAST(programming AS text[])'に戻さないとエラー出るかも
    # ------------------------------------------------------------------
    def params_user_search
      params.permit(:name_cont, :age_eq)
    end

    # ------------------------------------------------------------------
    # before_action
    # ------------------------------------------------------------------
    # 正しいユーザーかどうか確認,違ってたらリダイレクト
    def correct_user
      @user = User.find(params[:id])
      redirect_to users_path, danger: '権限のないリクエストです' unless @user == current_user
    end
end
