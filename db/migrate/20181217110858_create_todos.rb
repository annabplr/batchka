class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.bigint :menu_id
      t.bigint :ingredient_id
      t.string :actionverb
      t.string :daydue
      t.string :comments
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
