class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :startDate
      t.string :direction
      t.float :latitude
      t.float :longitude
      t.string :description

      t.timestamps
    end
  end
end
