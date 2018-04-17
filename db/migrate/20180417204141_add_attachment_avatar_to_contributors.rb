class AddAttachmentAvatarToContributors < ActiveRecord::Migration[5.1]
  def self.up
    change_table :contributors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :contributors, :avatar
  end
end
