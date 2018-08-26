# CSVデータインポート用
# emailとパスワード設定が必要

require 'csv'

# rake import:users
namespace :import do
  desc "Import users from csv"

  task users: :environment do
    path = File.join Rails.root, "db/csv/csv_data.csv"
    puts "path: #{path}"      # 確認用にターミナルに表示させている
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
          email: row["email"],
          password: row["password"],
          password_confirmation: row["password_confirmation"],
      }
    end
    puts "start to create users data"     # 確認用にターミナルに表示させている
    begin
      User.create!(list)
      puts "completed!!"    # 確認用にターミナルに表示させている
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end
