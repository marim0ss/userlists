class User < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  serialize :programming

  validates :name, presence: true
  validates :age, presence: true
  validates :mail, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, presence: true
  validates :address, presence: true
  validates :gender, presence: true
  validates :program, presence: true
  validates :skils, presence: true
  validates :image, presence: true

  #処理をモデル側で行う
  # food2参照    コントローラ側で引数指定したを受け取って使用
  def disp_prog(programming)
    if programming.nil?
      "NO DATA"
    else
      programming.join("、")
    end
  end

end
