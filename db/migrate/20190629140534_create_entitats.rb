class CreateEntitats < ActiveRecord::Migration[5.2]
  def change
    create_table :entitats do |t|
      t.integer :user_id
      t.string :ambit
      t.integer :pare
      t.string :tipus_via
      t.string :nom_via
      t.string :numero_via
      t.string :bloc
      t.integer :codi_postal
      t.string :poblacio
      t.string :provincia
      t.integer :any_construccio
      t.decimal :superficie_util
      t.string :nom_propietari
      t.string :cognoms_propietari
      t.string :tipus_document_identitat_propietari
      t.string :numero_document_identitat_propietari
      t.string :email_propietari
      t.string :telefon_propietari
      t.string :adreca_propietari
      t.string :codi_postal_propietari
      t.string :municipi_propietari
      t.text :descripcio
      t.string :destinacio
      t.decimal :quota

      t.timestamps
    end
  end
end
