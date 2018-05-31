class CreateFoundations < ActiveRecord::Migration[5.1]
  def change
    create_table :foundations do |t|
      t.string :name
      t.string :direction
      t.float :latitude
      t.float :longitude
      t.string :howToHelp
      t.string :contactUs
      t.string :description
      t.timestamps
    end
  end
end
