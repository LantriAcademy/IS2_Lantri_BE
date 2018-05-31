class CreateDirectors < ActiveRecord::Migration[5.1]
  def change
    create_table :directors do |t|
      t.string :bio
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
