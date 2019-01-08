class AddLinkToPlatsAndShopToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :shop, :string
    add_column :plats, :link, :string
  end
end
