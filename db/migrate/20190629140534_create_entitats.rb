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
      t.string :tipus_identificacio_propietari
      t.string :identificacio_propietari
      t.string :email_propietari
      t.string :telefon_propietari
      t.string :adreca_propietari
      t.string :codi_postal_propietari
      t.string :poblacio_propietari
      t.string :provincia_propietari
      t.text :descripcio
      t.string :destinacio
      t.decimal :quota
      t.string :nom
      t.integer :altitud_municipi
      t.string :regim_juridic
      t.string :nom_representant
      t.string :cognoms_representant
      t.string :tipus_identificacio_representant
      t.string :identificacio_representant
      t.string :adreca_representant
      t.string :codi_postal_representant
      t.string :poblacio_representant
      t.string :provincia_representant
      t.string :telefon_representant
      t.string :email_representant
      t.string :nom_tecnic
      t.string :cognoms_tecnic
      t.string :tipus_identificacio_tecnic
      t.string :identificacio_tecnic
      t.string :titulacio_tecnic
      t.string :colegi_tecnic
      t.string :num_colegiat_tecnic
      t.string :adreca_tecnic
      t.string :codi_postal_tecnic
      t.string :poblacio_tecnic
      t.string :provincia_tecnic
      t.string :telefon_tecnic
      t.string :email_tecnic

      t.timestamps
    end
  end
end
