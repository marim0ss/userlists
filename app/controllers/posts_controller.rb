class PostsController < ApplicationController
  def index
    # ユーザーごとの投稿の一覧
    @posts = Post.where(user_id: params[:user_id])
    #params[:user_id] ...user_idのパラメータが飛んできたのを
    # where(user_id   )で探す
    @user = User.find(params[:user_id])
    #ここでもuser_idを活用してユーザーの情報を取ってくる
  end

  def new
    # ここでもユーザーに紐づいた投稿をしたいのでparams[:user_id]でユーザーを探す
    @user = User.find(params[:user_id])
    @post = Post.new
    #１投稿なのでpost 単数形
  end

  #新規作成
  def create
    #createアクションでstrong parameter のメソッドを呼び出す
    # Post.create(posts_params)
    # Post.create(user_id: params[:user_id], content: posts_params[:content], post_image_name: posts_params[:post_image_name])

    Post.create(user_id: params[:user_id], content: posts_params[:content], post_image_name: posts_params[:post_image_name], image: posts_params[:image])
    # posts_paramsは下のストロングパラメータで定義したメソッドを呼び出している
  end


  #編集
  # def edit
    # @user = User.find(params[:user_id])
    # 編集するユーザーの情報を取得
    # @post = Post.where(user_id: params[:user_id])
  # end


  #更新
  # def update
    # user = User.find(params[:id])
    # user.update(users_params)
  # end

  #削除
  # def destroy
    # post = Post.find_by(id: params[id])
    # user = User.find(params[:id])
    # user.destroy
  # end

  def set_current_user_post
    @post = current_user.posts.find(params[:id])
  end



  #ストロングパラメータを定義
  private
    def posts_params
      params.require(:post).permit(:content, :post_image_name, :image)
      # params.require(:post) のpostはsinmple simple_form_forで使った@postを指している
    end
      #値を送信した時に、contentはpostの配下として送信されている。user_idは独立して送信されているのでpost_paramsにはしない

    #このように書けばストロングパラメータとして同じように記述できる
    # def user_id_params
    #   params.require(:post).permit(:user_id)
    # end
end
