# == Schema Information
#
# Table name: submissions
#
#  id          :integer          not null, primary key
#  url         :string(255)
#  title       :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
