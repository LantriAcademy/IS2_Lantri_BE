class Contributor < ApplicationRecord
    has_and_belongs_to_many :events
    has_many :helps
    has_many :interests
    has_many :pictures, as: :imageable

    validates_associated :events
    validates_associated :helps
    validates_associated :interests
    validates_associated :pictures

    validates :description, presence:true
    validates :description, length: { maximum: 500 }
    validates :description, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
    
end
