class Interest < ApplicationRecord
    has_many :contributors
    has_many :foundations

    validates :name, presence: true
    validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
    validates :description, length: {maximum: 500 }, allow_nil: true
    
end
