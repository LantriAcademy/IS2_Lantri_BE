class AddAttachmentAvatarToEvidences < ActiveRecord::Migration[5.1]
  def self.up
    change_table :evidences do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :evidences, :avatar
  end
end
