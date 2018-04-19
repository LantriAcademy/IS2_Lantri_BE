# == Schema Information
#
# Table name: evidences
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  event_id    :integer
#  picture_id  :integer
#

class Evidence < ApplicationRecord
    has_one :event
    has_many :pictures, as: :imageable
    
    validates_associated :pictures
    
    mount_base64_uploader :avatar, AvatarUploader
    
    validates :description, presence: true
    validates :description, length: { maximum: 500 }

    
end
