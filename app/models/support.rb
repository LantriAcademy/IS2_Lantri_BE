class Support < ApplicationRecord
    has_one :help
    has_many :pictures, as: :imageable
end
