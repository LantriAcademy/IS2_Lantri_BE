class CreateInterestContributors < ActiveRecord::Migration[5.1]
  def change
    create_table :interest_contributors do |t|
      t.belongs_to :contributor, index: true
      t.belongs_to :interest, index: true
      t.timestamps
      
    end
  end
end
