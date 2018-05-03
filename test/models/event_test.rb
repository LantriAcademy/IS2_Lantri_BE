# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  startDate      :datetime
#  direction      :string
#  latitude       :float
#  longitude      :float
#  description    :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  foundation_id  :integer
#  evidence_id    :integer
#  contributor_id :integer
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
