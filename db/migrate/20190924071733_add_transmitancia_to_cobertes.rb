class AddTransmitanciaToCobertes < ActiveRecord::Migration[5.2]
  def change
    add_column :cobertes, :transmitancia_coberta, :decimal
  end
end
