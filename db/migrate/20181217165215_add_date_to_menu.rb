class AddDateToMenu < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :startdate, :date
  end
end
