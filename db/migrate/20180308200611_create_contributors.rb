class CreateContributors < ActiveRecord::Migration[5.1]
  def change
    create_table :contributors do |t|
      t.string :description
      t.string :user
      t.string :name
      t.string :lastname
      t.string :email,null: false, default: ""
      t.string :phone

      t.timestamps
    end
  end
end
