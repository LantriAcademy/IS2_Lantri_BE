class Contributor < ApplicationRecord
    has_and_belongs_to_many :events
    has_many :helps
    has_many :interests
    has_many :pictures, as: :imageable
end
