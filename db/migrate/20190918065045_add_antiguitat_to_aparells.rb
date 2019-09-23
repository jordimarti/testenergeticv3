class AddAntiguitatToAparells < ActiveRecord::Migration[5.2]
  def change
    add_column :aparells, :antiguitat, :integer
    add_column :aparells, :qualificacio_energetica, :string
  end
end
