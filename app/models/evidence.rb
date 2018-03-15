class Evidence < ApplicationRecord
    has_one :event
    has_many :pictures, as: :imageable
    
    validates_associated :pictures
    
    validates :description, presence: true
    validates :description, length: { maximum: 500 }

    
end
