class Help < ApplicationRecord
    has_one :contributor
    has_one :benefited
    has_one :support
    has_one :type_of_help
    has_one :status_of_help

    validates_associated :contributor
    validates_associated :benefited
    validates_associated :support
    validates_associated :type_of_help
    validates_associated :status_of_help

	validates :description, presence:true
    validates :description, length: { maximum: 500 }
    validates :description, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }

    validates :startDate, inclusion: { in: Date.today..Date.civil(2800, 1, 1)}

end
