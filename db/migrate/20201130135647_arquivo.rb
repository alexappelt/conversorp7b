class Arquivo < ActiveRecord::Migration[6.0]
  def change
    create_table :arquivos do |t|
      t.string :nome
      end
  end
end
