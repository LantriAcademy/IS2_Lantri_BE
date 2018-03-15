class Foundation < ApplicationRecord
    has_one :admin
    has_many :events
    has_many :benefiteds
    has_many :interests
    has_many :pictures, as: :imageable
end
