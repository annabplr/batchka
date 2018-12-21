class DeleteBooleansFields < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :instock
    remove_column :repas, :athome
    remove_column :todos, :done
    remove_column :users, :everyday
    remove_column :users, :breakfast
    remove_column :users, :lunch
    remove_column :users, :dinner
    remove_column :users, :collation
    remove_column :users, :starter
    remove_column :users, :maincourse
    remove_column :users, :dessert
    add_column :ingredients, :instock, :boolean
    add_column :repas, :athome, :boolean
    add_column :todos, :done, :boolean
    add_column :users, :everyday, :boolean
    add_column :users, :breakfast, :boolean
    add_column :users, :lunch, :boolean
    add_column :users, :dinner, :boolean
    add_column :users, :collation, :boolean
    add_column :users, :starter, :boolean
    add_column :users, :maincourse, :boolean
    add_column :users, :dessert, :boolean
  end
end
