class User < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  serialize :programming

# postモデルと紐付ける。１人のuserはたくさんのpostをもつ
  has_many :posts

# ユーザー名前検索
  attr_accessor :name
  def execute
      User.ransack(name_eq: @name)
  end

  #処理をモデル側で行う
  # food2参照    コントローラ側で引数指定したを受け取って使用
  # 反映されていない
    # def disp_prog(programming)
    #   if programming.nil?
    #     "NO DATA"
    #   else
    #     programming.join(",")
    #   end
    #
    # end
# =>decoratorで対応

end
