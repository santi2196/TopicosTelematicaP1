class AddTokenToUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :token, :string
  end
end
