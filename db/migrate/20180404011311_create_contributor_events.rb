class CreateContributorEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :contributor_events do |t|
      t.belongs_to :contributor, index: true
      t.belongs_to :event, index: true
      t.timestamps
    end
  end
end
