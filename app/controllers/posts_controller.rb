class PostsController < ApplicationController
  def index
    @posts = Post.all

    # post1 = Post.new
    # @search_username = post1.search_username

  end

  def new
    @posts = Post.new
  end

  #新規作成
  def create
    #createアクションでstrong parameter のメソッドを呼び出す
    Post.create(posts_params)

  end




  #ストロングパラメータを定義
  private
    def posts_params
      params.require(:post).permit(:user_id, :content, :post_image_name)
    end
end
