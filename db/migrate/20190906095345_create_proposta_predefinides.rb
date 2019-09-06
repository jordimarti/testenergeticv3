class CreatePropostaPredefinides < ActiveRecord::Migration[5.2]
  def change
    create_table :proposta_predefinides do |t|
      t.string :codi
      t.string :mesura_ca
      t.string :mesura_es
      t.decimal :a_b3
      t.decimal :a_c2
      t.decimal :a_d1
      t.decimal :a_d2
      t.decimal :a_d3
      t.decimal :a_e1
      t.decimal :b_b3
      t.decimal :b_c2
      t.decimal :b_d1
      t.decimal :b_d2
      t.decimal :b_d3
      t.decimal :b_e1
      t.decimal :c_b3
      t.decimal :c_c2
      t.decimal :c_d1
      t.decimal :c_d2
      t.decimal :c_d3
      t.decimal :c_e1
      t.decimal :d_b3
      t.decimal :d_c2
      t.decimal :d_d1
      t.decimal :d_d2
      t.decimal :d_d3
      t.decimal :d_e1
      t.decimal :e_b3
      t.decimal :e_c2
      t.decimal :e_d1
      t.decimal :e_d2
      t.decimal :e_d3
      t.decimal :e_e1
      t.decimal :f_b3
      t.decimal :f_c2
      t.decimal :f_d1
      t.decimal :f_d2
      t.decimal :f_d3
      t.decimal :f_e1
      t.decimal :g_b3
      t.decimal :g_c2
      t.decimal :g_d1
      t.decimal :g_d2
      t.decimal :g_d3
      t.decimal :g_e1
      t.decimal :h_b3
      t.decimal :h_c2
      t.decimal :h_d1
      t.decimal :h_d2
      t.decimal :h_d3
      t.decimal :h_e1
      t.decimal :i_b3
      t.decimal :i_c2
      t.decimal :i_d1
      t.decimal :i_d2
      t.decimal :i_d3
      t.decimal :i_e1
      t.decimal :preu
      t.string :tipus_proposta
      t.text :descripcio

      t.timestamps
    end
  end
end
