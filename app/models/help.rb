# == Schema Information
#
# Table name: helps
#
#  id                :integer          not null, primary key
#  description       :string
#  startDate         :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  contributor_id    :integer
#  benefited_id      :integer
#  support_id        :integer
#  type_of_help_id   :integer
#  status_of_help_id :integer
#

class Help < ApplicationRecord
    belongs_to :contributor
    belongs_to :benefited
    has_one :support
    has_one :type_of_help
    has_one :status_of_help

    #validates_associated :support
    #validates_associated :type_of_help
    #validates_associated :status_of_help

    #validates :description, length: { maximum: 500 }

    #validates :startDate, inclusion: { in: Date.today..Date.civil(2800, 1, 1)}

end

