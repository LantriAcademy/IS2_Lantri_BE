class AddAuthenticationTokenToDirectors < ActiveRecord::Migration[5.1]
  def change
    add_column :directors, :authentication_token, :string, limit: 30
    add_index :directors, :authentication_token, unique: true
  end
end
