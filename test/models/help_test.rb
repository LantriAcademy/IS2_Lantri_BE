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

require 'test_helper'

class HelpTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
