class CreateStatusOfHelps < ActiveRecord::Migration[5.1]
  def change
    create_table :status_of_helps do |t|
      t.string :name

      t.timestamps
    end
  end
end
