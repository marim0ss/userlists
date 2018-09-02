namespace :greet do  #4.名前空間 greetという名前空間に挨拶をするタスクを定義
  desc "Helloを表示するタスク"    #1.タスクの説明を書く =description(説明)

 #task_name => タスクの名前をつける
  # :environment =>実行したい処理を記述する場所
  task say_hello: :environment do
    puts "Hello!!"
  end

  desc "GoodByeを表示するタスク"
  task say_goodbye: :environment do
    puts "Goodbye"
  end

end

  # greet_when_datingという名前空間に、デート時の挨拶をするタスクを定義
namespace :greet_when_dating do

  desc "容疑を褒める"
  task praise_appearance: :environment do
    puts "You're beautiful!!"
  end

  desc "ファッションを褒める"
  task praise_fashion: :environment do
    puts "That's  fashionable!!"
  end

end
