class CreateContributors < ActiveRecord::Migration[5.1]
  def change
    create_table :contributors do |t|
      t.string :description
      t.string :user
      t.string :name
      t.string :lastname
      t.string :email,null: false, default: ""
      t.string :phone
      t.string :type_user
      t.string :token_reset_pass
      t.integer :disable_count
      t.timestamps
    end
  end
end
