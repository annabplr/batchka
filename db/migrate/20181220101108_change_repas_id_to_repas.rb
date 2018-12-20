class ChangeRepasIdToRepas < ActiveRecord::Migration[5.2]
  def change
    rename_column :plats, :repas_id, :repa_id
  end
end
