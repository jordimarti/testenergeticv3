class CreateTerres < ActiveRecord::Migration[5.2]
  def change
    create_table :terres do |t|
      t.integer :entitat_id
      t.string :ambit
      t.string :nom
      t.text :descripcio
      t.decimal :superficie
      t.decimal :percentatge
      t.decimal :transmitancia_terra
      t.string :profunditat

      t.timestamps
    end
  end
end
