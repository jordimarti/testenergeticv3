class AddTipologiaToEntitats < ActiveRecord::Migration[5.2]
  def change
    add_column :entitats, :tipologia, :string
  end
end
