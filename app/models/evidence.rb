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
    
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    
    validates :description, presence: true
    validates :description, length: { maximum: 500 }

    
end
