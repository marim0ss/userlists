class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  #新規作成
  def create
    #createアクションでstrong parameter のメソッドを呼び出す
    Post.create(user_id: user_params[:user_id], content: posts_params[:content], post_image_name: posts_params[:post_image_name])
  end

  #ストロングパラメータを定義
  private
    def posts_params
      params.require(:post).permit(:content, :post_image_name)
    end
    def user_params
      params.permit(:user_id)
    end
end
