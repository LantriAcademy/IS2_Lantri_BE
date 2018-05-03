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
    
    mount_base64_uploader :avatar, AvatarUploader
    

    validates :user, :name, :lastname , :email, :phone, presence: true
    validates :name, :user, :lastname, format: { with: /\A[a-zA-Z\s]+\z/,message: "only allows letters" }
    #validates :phone, numericality: true
    validates :email, email: true
    validates :user, length: {maximum: 30 }
    
    
    def self.GetYearsEvent(id)
        c = Contributor.find(id).events.pluck(:startDate).map(&:"year").uniq
        return c
    end
    
    def self.GetYearsEventData(y,id)
        year = y.to_i
        e = Contributor.find(id).events.where(startDate: Date.civil(year)..Date.civil(year + 1) )
        month = ["ENE","FEB","MAR","ABR","MAY","JUN","JUL","AGO","SEP","OCT","NOV","DIC"]
        arr = []
        for i in 0..10
          arr << {"x": month[i], "y": e.where( startDate: Date.civil(year,i + 1)..Date.civil(year,i + 2)).count}
        end
        arr << {"x": month[11], "y": e.where( startDate: Date.civil(year,12)..Date.civil(year + 1 , 1)).count}
      return [{"id": year.to_s, "data": arr}]
    end
    
end
