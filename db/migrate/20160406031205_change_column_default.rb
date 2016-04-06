class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column_default :projects, :business, 0
    change_column_default :projects, :social, 0
    change_column_default :projects, :music, 0
    change_column_default :projects, :art, 0
    change_column_default :projects, :event, 0
    change_column_default :projects, :product, 0
    change_column_default :projects, :app, 0
    change_column_default :projects, :game, 0
    change_column_default :projects, :food, 0
    change_column_default :projects, :global, 0
    change_column_default :projects, :fashion, 0
    change_column_default :projects, :movie, 0
    change_column_default :projects, :book, 0
  end
end
