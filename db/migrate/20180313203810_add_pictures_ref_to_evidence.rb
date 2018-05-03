class AddPicturesRefToEvidence < ActiveRecord::Migration[5.1]
  def change
    add_reference :evidences, :picture, foreign_key: true
  end
end
