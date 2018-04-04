class CreateDirectors < ActiveRecord::Migration[5.1]
  def change
    create_table :directors do |t|
      t.string :bio
      t.string :user
      t.string :password
      t.string :name
      t.string :lastname
      t.string :email
      t.string :phone

      t.timestamps
      
    end
  end
end
