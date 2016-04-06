class AddSomethingToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :business, :integer
    add_column :projects, :social, :integer
    add_column :projects, :music, :integer
    add_column :projects, :art, :integer
    add_column :projects, :event, :integer
    add_column :projects, :product, :integer
    add_column :projects, :app, :integer
    add_column :projects, :game, :integer
    add_column :projects, :food, :integer
    add_column :projects, :global, :integer
    add_column :projects, :fashion, :integer
    add_column :projects, :movie, :integer
    add_column :projects, :book, :integer
  end
end
