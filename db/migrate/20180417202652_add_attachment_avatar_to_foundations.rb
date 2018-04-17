class AddAttachmentAvatarToFoundations < ActiveRecord::Migration[5.1]
  def self.up
    change_table :foundations do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :foundations, :avatar
  end
end
