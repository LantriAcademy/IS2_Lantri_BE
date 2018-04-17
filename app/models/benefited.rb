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
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    validates :age,:name, presence: true
    validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }


    def self.GetBeneficiedFoundationPage(page,found_id)
        return Benefited.where(foundation: found_id).limit(6).offset((page.to_i-1)*6)
    end
    
    def self.BeneficiedFoundationActualSize(found_id)
        return Benefited.where(foundation_id: found_id).count()
    end
    
end
