# == Schema Information
#
# Table name: interests
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  contributor_id :integer
#  foundation_id  :integer
#

require 'test_helper'

class InterestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
