# == Schema Information
#
# Table name: thread_upvotes
#
#  id            :integer          not null, primary key
#  submission_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ThreadUpvoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
