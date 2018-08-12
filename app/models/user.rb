class User < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  serialize :programming

# postモデルと紐付ける。１人のuserはたくさんのpostをもつ
  has_many :posts


end
