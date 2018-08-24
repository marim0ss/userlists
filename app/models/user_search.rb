class UserSearch < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :name_cont, :age_eq

  # ransack検索用のメソッド
  def execute
    User.search(name_cont: @name_cont, age_eq: @age_eq).result
  end
  # ※userモデルに検索用のメソッドを実装する場合、インスタンス変数の名前がテーブルのカラム名と同じ値になると、データが登録できない状態になるので注意
end


  # 最初のname_contはモデルのnameはカラム名に一致させる = 検索したい文字がnameと一緒だったら表示できるようになる
  # attr_accessorで設定したname_cont = @name_contコントローラのparamas[:name_cont]
  # contは文字列が対象なのでcontは使えなかった
