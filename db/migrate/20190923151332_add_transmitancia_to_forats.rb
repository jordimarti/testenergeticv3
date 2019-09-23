class AddTransmitanciaToForats < ActiveRecord::Migration[5.2]
  def change
    add_column :forats, :transmitancia_global_forat, :decimal
  end
end
