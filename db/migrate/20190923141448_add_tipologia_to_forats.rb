class AddTipologiaToForats < ActiveRecord::Migration[5.2]
  def change
    add_column :forats, :tipus_marc, :string
    add_column :forats, :tipus_vidre, :string
  end
end
