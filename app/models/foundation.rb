# == Schema Information
#
# Table name: foundations
#
#  id           :integer          not null, primary key
#  name         :string
#  direction    :string
#  latitude     :float
#  longitude    :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  event_id     :integer
#  admin_id     :integer
#  benefited_id :integer
#  interest_id  :integer
#  picture_id   :integer
#

class Foundation < ApplicationRecord
    #before_validation :parse_image
    #attr_accessor :image_base
    
    has_one :director
    has_many :events
    has_many :benefiteds
    
    has_many :interest_foundations
    has_many :interests,through: :interest_foundations
    
    has_many :pictures, as: :imageable
    
    mount_base64_uploader :avatar, AvatarUploader

    validates_associated :interests
    validates_associated :pictures
    
    #has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    #validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    validates :name, :direction, :latitude, :longitude,  presence: true
    validates :name, format: { with: /\A[a-zA-Z\s]+\z/,message: "only allows letters" }
    validates :direction, length: {maximum: 100 }
    validates :latitude, :longitude, numericality: {only_float: true}
    
    def self.GetFundationPage(page)
        return Foundation.limit(6).offset((page.to_i-1)*6)
    end
    
    def self.ActualSize()
        return Foundation.count()
    end
    
    def self.GetFundationNumberBenefi(min,max,id)
        array = []
        f = Foundation.find(id)
        for i in min..max
            c = f.benefiteds.where(age: i).count
            array << {"age": i, "count": c}
        end
        return array
    end
    
    #private 
    #def parse_image 
    #    image = Paperclip.io_adapters.for(image_base) 
    #    image.original_filename = "file.jpg" 
    #    self.avatar = image 
    #end

    #def sel.GetBenefiteds(id)
     #   return Foundation.find(id).joins(:benefiteds)
    #end
    
end
