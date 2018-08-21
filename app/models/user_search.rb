class UserSearch < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :name_cont, :age_eq

  # 検索用のメソッド
  def execute
    User.search(name_cont: @name_cont, age_eq: @age_eq).result
  end
  # ※userモデルに検索用のメソッドを実装する場合、インスタンス変数の名前がテーブルのカラム名と同じ値になると、データが登録できない状態になるので注意
end
