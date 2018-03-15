class Evidence < ApplicationRecord
    has_one :event
    has_many :pictures, as: :imageable
    
    validates_associated :event
    validates_associated :pictures
    
    validates :description, presence: true
    validates :description, length: { maximum: 500 }
    validates :description, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
    
end
