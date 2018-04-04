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

require 'test_helper'

class StatusOfHelpTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
