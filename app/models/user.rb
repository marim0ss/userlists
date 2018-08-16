class User < ActiveRecord::Base

 # has_secure_passwordを宣言することで、password, password_confirmationをUserモデルのプロパティとして使用することができる
      # （DB上での管理ではなくメモリ上で値を保持できるようになる）
  has_secure_password validations: true
  # trueを和すことによって
    # 1.userの新規登録時にpasswordの必須入力
    # 2.passwordとpassword_confirmationの内容が合致すること      のバリデーションがかかる

  #=====================================================================
  validates :name, :email, presence: true, uniqueness: true

  # 画像表示に使用
  mount_uploader :image, PictureUploader

  #programmingカラム、[""]を除去
  serialize :programming

  # postモデルと紐付ける。１人のuserはたくさんのpostをもつ
  has_many :posts

  # ログイン処理に使用  ランダムなトークンを返す
  def self.new_remember_token
   SecureRandom.urlsafe_base64   #ランダムな文字列を生成
 end

 def self.encrypt(token)
   Digest::SHA256.hexdigest(token.to_s)
 end
end
