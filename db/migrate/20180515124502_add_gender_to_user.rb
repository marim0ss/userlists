class AddGenderToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :birth_date, :date
    add_column :users, :how_are_you, :string
    add_column :users, :programming, :string
  end
end
