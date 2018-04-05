# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  startDate      :datetime
#  direction      :string
#  latitude       :float
#  longitude      :float
#  description    :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  foundation_id  :integer
#  evidence_id    :integer
#  contributor_id :integer
#

class Event < ApplicationRecord
    
    belongs_to :foundation
    has_many :evidences
    
    has_many :contributor_events
    has_many :contributors ,through: :contributor_events
    
    #validates_associated :foundation
    #validates_associated :evidences

    validates :name, :startDate, :direction, :description, presence: true
    validates :name, length: { maximum: 45 }
    validates :direction, length: { maximum: 45 }
    validates :description, length: { maximum: 450 }
    validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }

    validates :startDate, inclusion: { in: Date.today..Date.civil(2800, 1, 1)}
    
end
