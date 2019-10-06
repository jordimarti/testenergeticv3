class AddValorToTerres < ActiveRecord::Migration[5.2]
  def change
    add_column :terres, :resistencia_termica_aillant, :decimal
    add_column :terres, :longitud_perimetre, :decimal
    add_column :terres, :ample_aillament, :decimal
    add_column :terres, :valor, :decimal
  end
end
