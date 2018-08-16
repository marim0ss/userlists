class Post < ActiveRecord::Base
  mount_uploader :image, PostimageUploader
  # userモデルと紐付ける。複数のpostsが1人のuserに属する
  belongs_to :user

end
