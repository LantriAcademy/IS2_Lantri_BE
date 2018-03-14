class AddEventRefToEvidence < ActiveRecord::Migration[5.1]
  def change
    add_reference :evidences, :event, foreign_key: true
  end
end
