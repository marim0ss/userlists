class AddPasswordDigestToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email, :string,   limit: 191,   null: false
    add_column :users, :password_digest, :string,   limit: 191,   null: false
    add_column :users, :remember_token, :string,    limit: 191
  end
end
