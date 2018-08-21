class UserSearch < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :name_cont, :age_cont

  # 検索用のメソッド
  def execute
    User.search(name_eq: @name_cont, age_eq: @age_cont).result
  end
  # ※userモデルに検索用のメソッドを実装する場合、インスタンス変数の名前がテーブルのカラム名と同じ値になると、データが登録できない状態になるので注意
end
