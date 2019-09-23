class CreateAparells < ActiveRecord::Migration[5.2]
  def change
    create_table :aparells do |t|
      t.integer :entitat_id
      t.string :ambit
      t.string :nom
      t.text :descripcio
      t.integer :potencia
      t.integer :hores_mensuals
      t.integer :consum_mensual

      t.timestamps
    end
  end
end
