require 'test_helper'
# tutorial users_signup_test.rb
class UsersNewUserTest < ActionDispatch::IntegrationTest

# 無効なユーザー登録に対するテストp
  test "invalid new_user information" do
    get new_user_path
    assert_no_difference 'User.count' do     #登録ユーザー数に変化なしのはず
      post users_path, params: { user: { name:  "invalid",
                                         email: "",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end
end