class AddUserInfo < ActiveRecord::Migration
  def change
    add_column :users, :job, :string
    add_column :users, :gender, :integer
    add_column :users, :introduction, :text
  end
end
