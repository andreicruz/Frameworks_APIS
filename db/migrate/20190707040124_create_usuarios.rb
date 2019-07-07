class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :sobrenome
      t.string :email
      t.string :senha
      t.string :cep
      t.string :logradouro
      t.string :complemento
      t.string :bairro
      t.string :localidade
      t.string :uf

      t.timestamps
    end
  end
end
