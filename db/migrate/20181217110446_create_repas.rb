class CreateRepas < ActiveRecord::Migration[5.2]
  def change
    create_table :repas do |t|
      t.string :repastype
      t.bigint :day_id
      t.boolean :athome, default: true

      t.timestamps
    end
  end
end
