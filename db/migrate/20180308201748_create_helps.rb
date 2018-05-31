class CreateHelps < ActiveRecord::Migration[5.1]
  def change
    create_table :helps do |t|
      t.string :description
      t.datetime :startDate

      t.timestamps
    end
  end
end
