# == Schema Information
#
# Table name: benefiteds
#
#  id            :integer          not null, primary key
#  age           :integer
#  preferences   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  foundation_id :integer
#  help_id       :integer
#  picture_id    :integer
#

class Benefited < ApplicationRecord
    belongs_to :foundation
    has_many :helps
    has_many :pictures, as: :imageable

    validates_associated :foundation
    validates_associated :helps
    validates_associated :pictures

    validates :age,:name, presence: true
    validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }

end
