class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors[attribute] << (options[:message] || "is not an email")
      end
    end
end
class Director < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
    has_one :foundation
    has_many :pictures, as: :imageable

    validates_associated :pictures
    validates_associated :foundation
    
    mount_base64_uploader :avatar, AvatarUploader

    validates :user, :name, :lastname , :email, :phone, presence: true
    validates :name, :user, :lastname, format: { with: /\A[a-zA-Z\s]+\z/,message: "only allows letters" }
    #validates :phone, numericality: true
    validates :email, email: true
    validates :bio, length: {maximum: 500 }, allow_nil: true
    validates :user, length: {maximum: 30 }
    

end
