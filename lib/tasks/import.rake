# CSVデータインポート用
# emailとパスワード設定が必要

require 'csv'

# rake import:users
namespace :import do
  desc "Import users from csv"

  task users: :environment do
    path = File.join Rails.root, "db/csv/csv_data.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
          email: row["email"],
          password: row["password"],
          password_confirmation: row["password_confirmation"],
      }
    end
    puts "start to create users data"
    begin
      User.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end
