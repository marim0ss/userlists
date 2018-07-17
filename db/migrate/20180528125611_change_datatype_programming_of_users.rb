class ChangeDatatypeProgrammingOfUsers < ActiveRecord::Migration
  def change
    change_column :users, :programming, 'text USING CAST(programming AS text[])'
  end
end
