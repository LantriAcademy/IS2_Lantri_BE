class ContributorEvent < ApplicationRecord
    belongs_to :contributor
    belongs_to :event
end
