class AddGruixToComponentPredefinitMur < ActiveRecord::Migration[5.2]
  def change
    add_column :component_predefinit_murs, :gruix, :decimal
    add_column :component_predefinit_murs, :resistencia_termica, :decimal
  end
end
