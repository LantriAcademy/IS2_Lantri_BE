class AddAuthenticationTokenToContributors < ActiveRecord::Migration[5.1]
  def change
    add_column :contributors, :authentication_token, :string, limit: 30
    add_index :contributors, :authentication_token, unique: true
  end
end
