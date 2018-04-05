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


    def self.GetBeneficiedFoundationPage(page,found_id)
        return Benefited.where(foundation: found_id).limit(6).offset((page.to_i-1)*6)
    end
    
    def self.BeneficiedFoundationActualSize(found_id)
        return Benefited.where(foundation_id: found_id).count()
    end
    
end
