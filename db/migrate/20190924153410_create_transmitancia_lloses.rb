class CreateTransmitanciaLloses < ActiveRecord::Migration[5.2]
  def change
    create_table :transmitancia_lloses do |t|
      t.decimal :resistencia_termica_aillant
      t.decimal :longitud_perimetre
      t.decimal :ample_aillament
      t.decimal :valor

      t.timestamps
    end
  end
end
