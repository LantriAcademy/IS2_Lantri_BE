# == Schema Information
#
# Table name: benefiteds
#
#  id            :integer          not null, primary key
#  age           :integer
#  preferences   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  foundation_id :integer
#  help_id       :integer
#  picture_id    :integer
#

require 'test_helper'

class BenefitedTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
