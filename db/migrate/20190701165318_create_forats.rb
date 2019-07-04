class CreateForats < ActiveRecord::Migration[5.2]
  def change
    create_table :forats do |t|
      t.integer :entitat_id
      t.string :ambit
      t.string :nom
      t.text :descripcio
      t.decimal :superficie
      t.integer :part_opaca
      t.integer :part_transparent
      t.decimal :percentatge

      t.timestamps
    end
  end
end
