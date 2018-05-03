# == Schema Information
#
# Table name: status_of_helps
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  help_id    :integer
#

class StatusOfHelp < ApplicationRecord
    has_one :help


    validates :name, presence: true
    validates :name, length: { maximum: 45 }
    validates :name, format: { with: /\A[a-zA-Z\s]+\z/,message: "only allows letters" }

end
