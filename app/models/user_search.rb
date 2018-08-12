class UserSearch < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :search_name, :search_age

  # 検索用のメソッド
  def execute
    User.ransack(name_eq: @search_name, age_eq: @search_age).result
  end
  # ※userモデルに検索用のメソッドを実装する場合、インスタンス変数の名前がテーブルのカラム名と同じ値になると、データが登録できない状態になるので注意
end
