class User < ActiveRecord::Base
  mount_uploader :image, PictureUploader

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
