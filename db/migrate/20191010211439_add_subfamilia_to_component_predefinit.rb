class AddSubfamiliaToComponentPredefinit < ActiveRecord::Migration[5.2]
  def change
    add_column :component_predefinits, :subfamilia, :string
    add_column :component_predefinits, :nom_ca, :string
    add_column :component_predefinits, :nom_es, :string
  end
end
