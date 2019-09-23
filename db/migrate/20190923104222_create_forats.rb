class CreateForats < ActiveRecord::Migration[5.2]
  def change
    create_table :forats do |t|
      t.integer :entitat_id
      t.string :ambit
      t.string :nom
      t.text :descripcio
      t.decimal :superficie_total
      t.decimal :superficie_opaca
      t.decimal :superficie_transparent
      t.decimal :superficie_marc
      t.decimal :transmitancia_opaca
      t.decimal :transmitancia_transparent
      t.decimal :transmitancia_marc
      t.decimal :longitud_contacte_marc_vidre
      t.decimal :longitud_contacte_marc_opac
      t.decimal :transmitancia_linial_marc_vidre
      t.decimal :transmitancia_linial_marc_opac
      t.integer :numero
      t.decimal :percentatge

      t.timestamps
    end
  end
end
