class AddAntiguitatToClimatitzacions < ActiveRecord::Migration[5.2]
  def change
    add_column :climatitzacions, :antiguitat_acs, :integer
    add_column :climatitzacions, :antiguitat_calefaccio_1, :integer
    add_column :climatitzacions, :antiguitat_calefaccio_2, :integer
    add_column :climatitzacions, :antiguitat_refrigeracio, :integer
    add_column :climatitzacions, :antiguitat_generacio, :integer
  end
end
