class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.string :weekday
      t.bigint :menu_id

      t.timestamps
    end
  end
end
