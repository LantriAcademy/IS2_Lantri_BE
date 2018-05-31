# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  name           :string
#  imageable_id   :integer
#  imagiable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Picture < ApplicationRecord
    belongs_to :imageable, polymorphic: true
    
    validates :name, :imageable_id, :imageable_type, presence: true
end
