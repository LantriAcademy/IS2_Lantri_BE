# == Schema Information
#
# Table name: contributors
#
#  id          :integer          not null, primary key
#  description :string
#  user        :string
#  password    :string
#  name        :string
#  lastname    :string
#  email       :string
#  phone       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  event_id    :integer
#  help_id     :integer
#  interest_id :integer
#  pictures_id :integer
#

require 'test_helper'

class ContributorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
