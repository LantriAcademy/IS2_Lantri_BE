class Benefited < ApplicationRecord
    belongs_to :foundation
    has_many :helps
    has_many :pictures, as: :imageable

    validates_associated :foundation
    validates_associated :helps
    validates_associated :pictures

    validates :age, presence: true

end
