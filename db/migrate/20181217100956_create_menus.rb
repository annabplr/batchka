class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :weekof
      t.string :season
      t.bigint :user_id

      t.timestamps
    end
  end
end
