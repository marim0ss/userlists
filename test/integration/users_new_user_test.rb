require 'test_helper'
# tutorial users_signup_test.rb
class UsersNewUserTest < ActionDispatch::IntegrationTest

# 無効なユーザー登録に対するテスト ============================================
  test "invalid new_user information" do
    get new_user_path
    assert_no_difference 'User.count' do     #登録ユーザー数に変化なしのはず
      post users_path, params: { user: { name:  "invalid",
                                         email: "invalid@ex.com",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end


  test "valid signup information" do
     get new_user_path
     assert_difference 'User.count', 1 do
       post users_path, params: { user: { name:  "Example User",
                                          email: "user@example.com",
                                          password:              "foobar",
                                          password_confirmation: "foobar" } }
     end
     follow_redirect!
     assert_template 'users/show'
     # assert sign_in(@user)
   end
end
