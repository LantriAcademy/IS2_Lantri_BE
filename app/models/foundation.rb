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
    
end
