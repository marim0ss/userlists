class PostsController < ApplicationController


  def index
    # ユーザーごとの投稿の一覧
    # @posts = Post.where(user_id: params[:user_id])
    @posts = Post.paginate(:page => params[:page], :per_page => 30).order('created_at DESC')

    #params[:user_id] ...user_idのパラメータが飛んできたのを
    # where(user_id   )で探す
    @user = User.find(params[:user_id])
    #ここでもuser_id(URL)を活用してユーザーの情報を取ってくる

    # @all_posts = Post.find_by_sql(['select * from posts order by updated_at DESC'])
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

    @user = params[:user_id]
    Post.create(user_id: params[:user_id], content: posts_params[:content], post_image_name: posts_params[:post_image_name], image: posts_params[:image])
    # posts_paramsは下のストロングパラメータで定義したメソッドを呼び出している

    redirect_to user_posts_path, warning: '投稿しました!'
  end


  #編集
  def edit
    @user = User.find(params[:user_id])

    # 編集するユーザーの情報を取得
    @post = Post.find(params[:id])
  end


  #更新
  def update
    post = Post.find(params[:id])

    post.update(posts_params)
    redirect_to user_posts_path, success: '投稿を更新しました'
  end

  # 削除
  def destroy
    user = User.find(params[:user_id])
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_posts_path, warning: '削除しました'
  end


  # みんなの投稿
  def post_table
    @posts = Post.all

    @posts.each do |post|
    @user = User.find_by(id: post.user_id)
    end
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
