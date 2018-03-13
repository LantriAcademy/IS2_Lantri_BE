class Benefited < ApplicationRecord
    belongs_to :foundation
    has_many :helps
    has_many :pictures, as: :imageable
end
