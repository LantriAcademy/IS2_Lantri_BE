class AddAttachmentAvatarToBenefiteds < ActiveRecord::Migration[5.1]
  def self.up
    change_table :benefiteds do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :benefiteds, :avatar
  end
end
