class DeleteDefaultValueToBoolean < ActiveRecord::Migration[5.2]
  def change
    change_column_default :ingredients, :instock, nil
    change_column_default :repas, :athome, nil
    change_column_default :todos, :done, nil
    change_column_default :users, :everyday, nil
    change_column_default :users, :breakfast, nil
    change_column_default :users, :lunch, nil
    change_column_default :users, :dinner, nil
    change_column_default :users, :collation, nil
    change_column_default :users, :starter, nil
    change_column_default :users, :maincourse, nil
    change_column_default :users, :dessert, nil
    add_column :ingredients, :unity, :string
  end
end
