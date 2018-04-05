# == Schema Information
#
# Table name: foundations
#
#  id           :integer          not null, primary key
#  name         :string
#  direction    :string
#  latitude     :float
#  longitude    :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  event_id     :integer
#  admin_id     :integer
#  benefited_id :integer
#  interest_id  :integer
#  picture_id   :integer
#

class Foundation < ApplicationRecord
    has_one :director
    has_many :events
    has_many :benefiteds
    
    has_many :interest_foundations
    has_many :interests,through: :interest_foundations
    
    has_many :pictures, as: :imageable

    validates_associated :interests
    validates_associated :pictures

    validates :name, :direction, :latitude, :longitude,  presence: true
    validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
    validates :direction, length: {maximum: 100 }
    validates :latitude, :longitude, numericality: {only_float: true}
    
    def self.GetFundationPage(page)
        return Foundation.limit(6).offset((page.to_i-1)*6)
    end
    
    def self.ActualSize()
        return Foundation.count()
    end
    
end
