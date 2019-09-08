class CreateConsumGlobals < ActiveRecord::Migration[5.2]
  def change
    create_table :consum_globals do |t|
      t.integer :entitat_id
      t.string :ambit
      t.integer :consum_anual_electricitat
      t.integer :consum_anual_gas
      t.integer :consum_anual_gasoil
      t.decimal :despesa_anual_electricitat
      t.decimal :despesa_anual_gas
      t.decimal :despesa_anual_gasoil

      t.timestamps
    end
  end
end
