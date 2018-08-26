require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  #10-48fixures=>indexに対するテスト
  test "index including pagination" do
    # sign_in(@user)
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                         password: 'password' } }
    get users_path
    assert_template 'users/index'
    # assert_select 'div.pagination'
    # users = User.all
    # users.each do |user|
    #   assert_select 'a[href=?]', user_path(user), text: user.name
    # end
  end
end
