class CreateClimatitzacions < ActiveRecord::Migration[5.2]
  def change
    create_table :climatitzacions do |t|
      t.integer :entitat_id
      t.string :ambit
      t.string :tipologia_acs
      t.string :tipologia_calefaccio_1
      t.string :tipologia_calefaccio_2
      t.string :tipologia_refrigeracio
      t.string :generacio
      t.integer :percentatge_captadors_termics

      t.timestamps
    end
  end
end
