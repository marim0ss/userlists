class User < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  serialize :programming

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
