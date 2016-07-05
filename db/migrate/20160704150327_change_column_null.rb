class ChangeColumnNull < ActiveRecord::Migration
  def change
    change_column_null :lists, :created_at, true
    change_column_null :lists, :updated_at, true
  end
end
