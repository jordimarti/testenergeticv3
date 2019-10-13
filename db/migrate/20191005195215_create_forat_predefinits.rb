class CreateForatPredefinits < ActiveRecord::Migration[5.2]
  def change
    create_table :forat_predefinits do |t|
      t.string :nom_ca
      t.string :nom_es
      t.text :descripcio_ca
      t.text :descripcio_es
      t.integer :numero_forats
      t.string :tipus_marc
      t.decimal :superficie_marc
      t.decimal :transmitancia_marc
      t.string :tipus_vidre
      t.decimal :superficie_transparent
      t.decimal :transmitancia_transparent
      t.decimal :longitud_contacte_marc_vidre
      t.decimal :superficie_opaca
      t.decimal :transmitancia_opaca
      t.decimal :longitud_contacte_marc_opac

      t.timestamps
    end
  end
end
