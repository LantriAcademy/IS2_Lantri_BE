class AddEvidencesRefToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :evidence, foreign_key: true
  end
end
