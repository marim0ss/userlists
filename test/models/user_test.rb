require 'test_helper'

class UserTest < ActiveSupport::TestCase

  #setup内の処理は、各テストが走る直前に実行される
    # このメソッド内で、まず有効なUserオブジェクト(@user)を作成する
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
                      # パスワードとパスワード確認の値をセット
  end
end
