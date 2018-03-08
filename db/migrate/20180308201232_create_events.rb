class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :startDate
      t.string :direction
      t.float :latitude
      t.float :longitude
      t.float :description

      t.timestamps
    end
  end
end
