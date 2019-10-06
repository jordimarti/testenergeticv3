class CreateComponentPredefinitMurs < ActiveRecord::Migration[5.2]
  def change
    create_table :component_predefinit_murs do |t|
      t.string :familia
      t.string :nom
      t.decimal :conductivitat
      t.decimal :densitat

      t.timestamps
    end
  end
end
