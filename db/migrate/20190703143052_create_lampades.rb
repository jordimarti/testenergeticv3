class CreateLampades < ActiveRecord::Migration[5.2]
  def change
    create_table :lampades do |t|
      t.integer :entitat_id
      t.string :ambit
      t.string :tipologia
      t.string :descripcio
      t.integer :numero
      t.integer :potencia

      t.timestamps
    end
  end
end
