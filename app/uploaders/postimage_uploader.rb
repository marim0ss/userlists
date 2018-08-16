class PostimageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
    storage :file
    process convert: 'jpg'
    # 保存するディレクトリ名
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
    # バージョン指定でサイズを変えられる

    process :resize_to_limit => [1680, 1050]
    # thumb バージョン(width 400px x height 200px)
    version :thumb do
      process :resize_to_limit => [200, 200]
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
