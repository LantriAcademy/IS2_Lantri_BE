class Support < ApplicationRecord
    has_one :help
    has_many :pictures, as: :imageable
    
    validates_associated :pictures
    
    validates :date, :description, presence: true
    validates :description, length: { maximum: 450 }
    validates :date, inclusion: { in: Date.civil(1980, 1, 1)..Date.today}
    
    
    
end
