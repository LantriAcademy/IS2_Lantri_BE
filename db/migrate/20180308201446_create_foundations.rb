class CreateFoundations < ActiveRecord::Migration[5.1]
  def change
    create_table :foundations do |t|
      t.string :name
      t.string :direction
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
