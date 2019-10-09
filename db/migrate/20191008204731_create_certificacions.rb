class CreateCertificacions < ActiveRecord::Migration[5.2]
  def change
    create_table :certificacions do |t|
      t.integer :entitat_id
      t.string :ambit
      t.boolean :visible
      t.decimal :emissions
      t.decimal :demanda
      t.string :lletra_emissions
      t.string :lletra_demanda

      t.timestamps
    end
  end
end
