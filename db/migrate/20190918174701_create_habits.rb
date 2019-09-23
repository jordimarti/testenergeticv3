class CreateHabits < ActiveRecord::Migration[5.2]
  def change
    create_table :habits do |t|
      t.integer :entitat_id
      t.string :ambit
      t.string :nom
      t.text :descripcio

      t.timestamps
    end
  end
end
