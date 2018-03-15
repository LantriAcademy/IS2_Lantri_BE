class Event < ApplicationRecord
    belongs_to :foundation
    has_many :evidences
    has_and_belongs_to_many :contributors
end
