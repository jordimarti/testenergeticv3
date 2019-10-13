class CreateComponentPredefinits < ActiveRecord::Migration[5.2]
  def change
    create_table :component_predefinits do |t|
      t.string :familia
      t.string :subfamilia
      t.string :nom_ca
      t.string :nom_es
      t.decimal :conductivitat
      t.string :densitat
      t.decimal :gruix
      t.decimal :resistencia_termica

      t.timestamps
    end
  end
end
