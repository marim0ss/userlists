require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  # 有効なユーザー
  def setup
    @user = users(:michael)
  end


  # ユーザー loginのテスト =========================================
  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to user_posts_path(@user)
    follow_redirect!    # 実際のページに移動
    assert_template 'posts/index'     # 移動先に対応するページはあるか
    # count 0   渡したパターンに一致するリンクが０かどうかを確認
    assert_select "a[href=?]", login_path, count: 0  # ログインできた時ログインリンクはなくなるはず
    assert_select "a[href=?]", logout_path          # ログアウトリンクがある
    assert_select "a[href=?]", user_posts_path(@user)
  end
end
