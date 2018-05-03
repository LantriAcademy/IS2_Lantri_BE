class CreateEvidences < ActiveRecord::Migration[5.1]
  def change
    create_table :evidences do |t|
      t.string :description

      t.timestamps
    end
  end
end
