# == Schema Information
#
# Table name: interests
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  contributor_id :integer
#  foundation_id  :integer
#

class Interest < ApplicationRecord
    has_many :interest_contributors
    has_many :contributors, through: :interest_contributors
    
    has_many :interest_foundations
    has_many :foundations, through: :interest_foundations
    
    validates :name, presence: true
    validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
    validates :description, length: {maximum: 500 }, allow_nil: true

end
