class CreatePlats < ActiveRecord::Migration[5.2]
  def change
    create_table :plats do |t|
      t.bigint :repas_id
      t.string :name
      t.string :plattype

      t.timestamps
    end
  end
end
