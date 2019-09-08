class CreatePropostes < ActiveRecord::Migration[5.2]
  def change
    create_table :propostes do |t|
      t.integer :entitat_id
      t.string :ambit
      t.decimal :cost_optimista
      t.decimal :cost_pessimista
      t.decimal :estalvi_optimista
      t.decimal :estalvi_pessimista
      t.decimal :roi_optimista
      t.decimal :roi_pessimista
      t.decimal :emissions_optimista
      t.decimal :emissions_pessimista
      t.date :data
      t.string :mesura
      t.text :descripcio

      t.timestamps
    end
  end
end
