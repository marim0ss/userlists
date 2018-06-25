class PostsController < ApplicationController
  def index
    # ユーザーごとの投稿の一覧
    # @posts = Post.all

    # post1 = Post.new
    # @search_username = post1.search_username
    @posts = Post.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def new
    # @posts = Post.new
    @post = Post.new   #１投稿なのでpost 単数形
    @user = User.find(params[:user_id])
  end

  #新規作成
  def create
    #createアクションでstrong parameter のメソッドを呼び出す
    # Post.create(posts_params)
    Post.create(user_id: params[:user_id], content: posts_params[:content], post_image_name: posts_params[:post_image_name])
    # posts_paramsは下のストロングパラメータで定義したメソッドを呼び出している
  end




  #ストロングパラメータを定義
  private
    def posts_params
      params.require(:post).permit(:user_id, :content, :post_image_name)
      # params.require(:post).permit(:content, :post_image_name)
    end
    #
    # def user_id_params
    #   params.require(:post).permit(:user_id)
    # end
end
