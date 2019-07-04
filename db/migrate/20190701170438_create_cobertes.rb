class CreateCobertes < ActiveRecord::Migration[5.2]
  def change
    create_table :cobertes do |t|
      t.integer :entitat_id
      t.string :ambit
      t.string :nom
      t.text :descripcio
      t.decimal :superficie
      t.decimal :percentatge

      t.timestamps
    end
  end
end
