class ChangeDatatypeProgrammingOfUsers < ActiveRecord::Migration
  def change
    change_column :users, :programming, :text, USING programming::text[]
  end
end
