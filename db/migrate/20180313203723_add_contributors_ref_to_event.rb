class AddContributorsRefToEvent < ActiveRecord::Migration[5.1]
  def change
    # This is enough; you don't need to worry about order
    # create_join_table :contributors, :events
  
    # If you want to add an index for faster querying through this join:
    create_join_table :contributors, :events do |t|
        t.index :contributor_id
        t.index :event_id
      end
  end
end
