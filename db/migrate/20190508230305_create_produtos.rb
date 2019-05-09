class CreateProdutos < ActiveRecord::Migration[5.2]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :descricao
      t.float :preco
      t.references :categoria, foreign_key: true

      t.timestamps
    end
  end
end
