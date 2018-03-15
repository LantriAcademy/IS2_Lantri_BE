class Foundation < ApplicationRecord
    has_one :admin
    has_many :events
    has_many :benefiteds
    has_many :interests
    has_many :pictures, as: :imageable

    validates_associated :admin
    validates_associated :events
    validates_associated :benefiteds
    validates_associated :interests
    validates_associated :pictures
    
end
