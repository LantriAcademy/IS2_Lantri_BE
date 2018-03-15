class Event < ApplicationRecord
    
    belongs_to :foundation
    has_many :evidences
    has_and_belongs_to_many :contributors
    
    validates_associated :foundation
    validates_associated :evidences
    validates_associated :contributors
    
    validates :name, :startDate, :direction, :description, presence: true
    validates :name, length: { maximum: 45 }
    validates :direction, length: { maximum: 45 }
    validates :description, length: { maximum: 450 }
    validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }

    validates :startDate, inclusion: { in: Date.today..Date.civil(2800, 1, 1)}
    
end
