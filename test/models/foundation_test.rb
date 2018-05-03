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

require 'test_helper'

class FoundationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
