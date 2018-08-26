class PictureUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
    storage :file
    process convert: 'jpg'
    #  画像を保存するディレクトリ名を設定


    # デフォルト画像を設定.app/assets/images/default.jpgを探してくれる。
    def default_url
       "default.jpg"
    end

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
    # thumb バージョン(width 400px x height 200px)
    # 指定したハッシュを使えば画像サイズを決められる
    version :thumb do
      process :resize_to_fit => [100, 100]
    end
    # 許可する画像の拡張子 '空欄'カメラからアップロード用
    def extension_white_list
      ['jpg', 'jpeg', 'gif', 'png', '']
    end
    # 変換したファイルのファイル名の規則
    def filename
      "#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.jpg" if original_filename.present?
    end

  end
