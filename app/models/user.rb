class User < ActiveRecord::Base

  has_secure_password validations: true
  validates :email, presence: true, uniqueness: true

  mount_uploader :image, PictureUploader
  serialize :programming

# postモデルと紐付ける。１人のuserはたくさんのpostをもつ
  has_many :posts


end
