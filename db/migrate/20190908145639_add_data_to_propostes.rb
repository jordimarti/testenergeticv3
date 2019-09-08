class AddDataToPropostes < ActiveRecord::Migration[5.2]
  def change
    add_column :propostes, :data_any, :integer
    add_column :propostes, :data_mes, :integer
  end
end
