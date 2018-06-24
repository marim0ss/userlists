class Post < ActiveRecord::Base

  belongs_to :user

  # mount_uploader :post_image_name, PictureUploader

  def search_username
    User.find_by_sql("
      SELECT users.name
      FROM users, posts
      WHERE users.id = posts.user_id
      ")
  end

end
