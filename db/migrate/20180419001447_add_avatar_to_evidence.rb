class AddAvatarToEvidence < ActiveRecord::Migration[5.1]
  def change
    add_column :evidences, :avatar, :string
  end
end
