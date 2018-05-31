class ChangeDatatypeProgrammingOfUsers < ActiveRecord::Migration
  def change
    change_column :users, :programming, :text, array: true
  end
end
