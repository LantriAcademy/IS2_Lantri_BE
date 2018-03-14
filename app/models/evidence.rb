class Evidence < ApplicationRecord
    has_one :event
    has_many :pictures, as: :imageable
end
