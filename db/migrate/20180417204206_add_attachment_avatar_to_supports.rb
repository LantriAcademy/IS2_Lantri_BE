class AddAttachmentAvatarToSupports < ActiveRecord::Migration[5.1]
  def self.up
    change_table :supports do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :supports, :avatar
  end
end
