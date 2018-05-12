class UsersController < ApplicationController
  #一覧表示
    def index
      @users = User.all
    end

  #新規作成
  def new
    @users = User.new
  end

  #新規作成完了
  def create
    #createアクションでstrong parameter のメソッドを呼び出す
    User.create(users_params)
  end

  #詳細表示
  def show

  end

  #編集
  def edit
    # 編集するユーザーの情報を取得
    @user = User.find(params[:id])
  end


  #更新
  def update
    user = User.find(params[:id])
    users = user.update(users_params)
  end

  #削除
  def destroy

  end

  #ストロングパラメータを定義
  private
    def users_params
      params.require(:user).permit(:name, :age, :birthplace)
    end

end
