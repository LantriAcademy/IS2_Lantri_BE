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

    validates :name, :direction, :latitude, :longitude,  presence: true
    validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
    validates :direction, length: {maximum: 100 }
    validates :latitude, :longitude, numericality: {only_float: true}
end
