# == Schema Information
#
# Table name: supports
#
#  id          :integer          not null, primary key
#  description :string
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  help_id     :integer
#  picture_id  :integer
#

class Support < ApplicationRecord
    has_one :help
    has_many :pictures, as: :imageable
    
    validates_associated :pictures
    
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    
    validates :date, :description, presence: true
    validates :description, length: { maximum: 450 }
    validates :date, inclusion: { in: Date.civil(1980, 1, 1)..Date.today}
    
    
    
end
