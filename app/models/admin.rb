class Admin < ApplicationRecord
    has_one :foundation
    has_many :pictures, as: :imageable
end
