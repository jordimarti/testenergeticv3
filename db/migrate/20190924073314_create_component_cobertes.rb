class CreateComponentCobertes < ActiveRecord::Migration[5.2]
  def change
    create_table :component_cobertes do |t|
      t.integer :coberta_id
      t.string :nom
      t.decimal :conductivitat
      t.decimal :gruix
      t.decimal :resistencia_termica
      t.integer :posicio

      t.timestamps
    end
  end
end
