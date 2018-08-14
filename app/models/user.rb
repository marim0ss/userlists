class User < ActiveRecord::Base

  has_secure_password validations: true
  validates :email, presence: true, uniqueness: true

  # 画像表示に使用
  mount_uploader :image, PictureUploader

  #programmingカラム、[""]を除去
  serialize :programming

  # postモデルと紐付ける。１人のuserはたくさんのpostをもつ
  has_many :posts

  # ログイン処理に使用
  def self.new_remember_token
   SecureRandom.urlsafe_base64
 end

 def self.encrypt(token)
   Digest::SHA256.hexdigest(token.to_s)
 end
end
