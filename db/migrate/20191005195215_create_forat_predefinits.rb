class CreateForatPredefinits < ActiveRecord::Migration[5.2]
  def change
    create_table :forat_predefinits do |t|
      t.integer :entitat_id
      t.string :nom_ca
      t.string :nom_es
      t.text :descripcio_ca
      t.text :descripcio_es
      t.integer :numero_forats
      t.string :tipus_marc
      t.decimal :superficie_marc
      t.decimal :transmitancia_marc
      t.string :tipus_vidre
      t.decimal :superficie_vidre
      t.decimal :transmitancia_vidre
      t.decimal :longitud_contacte_vidre

      t.timestamps
    end
  end
end
