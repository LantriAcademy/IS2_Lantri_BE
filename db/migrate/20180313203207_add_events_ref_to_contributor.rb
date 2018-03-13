class AddEventsRefToContributor < ActiveRecord::Migration[5.1]
  def change
    add_reference :contributors, :event, foreign_key: true
  end
end
