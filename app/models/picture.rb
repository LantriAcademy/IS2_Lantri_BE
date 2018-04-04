class Picture < ApplicationRecord
    belongs_to :imageable, polymorphic: true
    
    validates :name, :imageable_id, :imageable_type, presence: true
end
