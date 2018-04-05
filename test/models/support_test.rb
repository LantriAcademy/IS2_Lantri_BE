# == Schema Information
#
# Table name: supports
#
#  id          :integer          not null, primary key
#  description :string
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  help_id     :integer
#  picture_id  :integer
#

require 'test_helper'

class SupportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
