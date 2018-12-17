class AddElementsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :beginweek, :string
    add_column :users, :groceryshopping, :string
    add_column :users, :everyday, :boolean, default: true
    add_column :users, :breakfast, :boolean, default: true
    add_column :users, :lunch, :boolean, default: true
    add_column :users, :dinner, :boolean, default: true
    add_column :users, :collation, :boolean, default: true
    add_column :users, :starter, :boolean, default: true
    add_column :users, :maincourse, :boolean, default: true
    add_column :users, :dessert, :boolean, default: true
  end
end
