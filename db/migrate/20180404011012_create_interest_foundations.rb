class CreateInterestFoundations < ActiveRecord::Migration[5.1]
  def change
    create_table :interest_foundations do |t|
      t.belongs_to :foundation, index: true
      t.belongs_to :interest, index: true
      t.timestamps
    end
  end
end
