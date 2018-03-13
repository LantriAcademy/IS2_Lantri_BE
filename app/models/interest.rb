class Interest < ApplicationRecord
    has_many :contributors
    has_many :foundations
end
