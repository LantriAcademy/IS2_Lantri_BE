# == Schema Information
#
# Table name: contributors
#
#  id          :integer          not null, primary key
#  description :string
#  user        :string
#  password    :string
#  name        :string
#  lastname    :string
#  email       :string
#  phone       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  event_id    :integer
#  help_id     :integer
#  interest_id :integer
#  pictures_id :integer
#

class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors[attribute] << (options[:message] || "is not an email")
      end
    end
end


class Contributor < ApplicationRecord
    acts_as_token_authenticatable
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
  
    has_many :contributor_events
    has_many :events ,through: :contributor_events
    
    has_many :helps
    
    has_many :interest_contributors
    has_many :interests ,through: :interest_contributors
    
    has_many :pictures , as: :imageable
    
    validates_associated :helps
    

    validates :user, :name, :lastname , :email, :phone, presence: true
    validates :name, :user, :lastname, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
    #validates :phone, numericality: true
    validates :email, email: true
    validates :user, length: {maximum: 30 }
    s
end
