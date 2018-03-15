class StatusOfHelp < ApplicationRecord
    has_one :help


    validates :name, presence: true
    validates :name, length: { maximum: 45 }
    validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }

end
