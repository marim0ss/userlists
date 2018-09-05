require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  # fixuresで設定したテストユーザー
  def setup
     @user       = users(:michael)
     @other_user = users(:archer)
   end

 #   # ログインユーザーが、他のユーザーの編集しようとした時
 # test "should redirect edit when logged in as wrong user" do
 #   log_in_as(@other_user)
 #   get edit_user_path(@user)
 #   assert flash.empty?    # フラッシュは出てない
 #   assert_redirected_to users_path
 # end
 #
 # test "should redirect update when logged in as wrong user" do
 #   log_in_as(@other_user)
 #   patch user_path(@user), params: { user: { name: @user.name,
 #                                             email: @user.email } }
 #   assert flash.empty?
 #   assert_redirected_to users_path
 # end



end
