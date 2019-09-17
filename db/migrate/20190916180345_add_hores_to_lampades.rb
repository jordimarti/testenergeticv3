class AddHoresToLampades < ActiveRecord::Migration[5.2]
  def change
    add_column :lampades, :hores_mensuals, :integer
  end
end
