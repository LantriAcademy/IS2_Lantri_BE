# == Schema Information
#
# Table name: evidences
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  event_id    :integer
#  picture_id  :integer
#

require 'test_helper'

class EvidenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
