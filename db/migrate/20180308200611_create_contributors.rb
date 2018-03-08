class CreateContributors < ActiveRecord::Migration[5.1]
  def change
    create_table :contributors do |t|
      t.string :description
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
