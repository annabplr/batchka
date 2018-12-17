class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.bigint :plat_id
      t.string :name
      t.string :ingredienttype
      t.integer :quantity
      t.boolean :instock, default: true

      t.timestamps
    end
  end
end
