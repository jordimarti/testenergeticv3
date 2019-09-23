class AddTransmitanciaToMurs < ActiveRecord::Migration[5.2]
  def change
    add_column :murs, :transmitancia_mur, :decimal
  end
end
