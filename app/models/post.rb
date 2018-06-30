class Post < ActiveRecord::Base

  belongs_to :user

  # mount_uploader :post_image_name, PictureUploader
  # userモデルと紐付ける。複数のpostsが1人のuserに属する
  belongs_to :user


  def search_username
    User.find_by_sql("
      SELECT users.name
      FROM users, posts
      WHERE users.id = posts.user_id
      ")
  end

end
