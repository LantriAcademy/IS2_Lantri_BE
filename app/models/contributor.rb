class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors[attribute] << (options[:message] || "is not an email")
      end
    end
end
class Contributor < ApplicationRecord
    
    has_many :contributors_events
    has_many :events ,through: :contributors_events
    
    has_many :helps
    
    has_many :interest_contributors
    has_many :interests ,through: :interest_contributors
    
    has_many :pictures , as: :imageable

    validates_associated :events
    validates_associated :helps
    validates_associated :interests
    validates_associated :pictures

    validates :user, :password, :name, :lastname , :email, :phone, presence: true
    validates :name, :user, :lastname, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
    #validates :phone, numericality: true
    validates :email, email: true
    validates :user, length: {maximum: 30 }
    
end
