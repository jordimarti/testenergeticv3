class AddTransmitanciaToForats < ActiveRecord::Migration[5.2]
  def change
    add_column :forats, :transmitancia_part_opaca, :decimal
    add_column :forats, :transmitancia_part_transparent, :decimal
    add_column :forats, :nom_part_opaca, :string
    add_column :forats, :nom_part_transparent, :string
    add_column :forats, :numero, :integer
  end
end
