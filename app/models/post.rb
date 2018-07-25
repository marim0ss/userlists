class Post < ActiveRecord::Base
  mount_uploader :image, PostimageUploader
  # userモデルと紐付ける。複数のpostsが1人のuserに属する
  belongs_to :user


  # def search_username
  #   User.find_by_sql("
  #     SELECT users.name
  #     FROM users, posts
  #     WHERE users.id = posts.user_id
  #     ")
  # end

end
