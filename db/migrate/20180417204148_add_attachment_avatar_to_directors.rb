class AddAttachmentAvatarToDirectors < ActiveRecord::Migration[5.1]
  def self.up
    change_table :directors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :directors, :avatar
  end
end
