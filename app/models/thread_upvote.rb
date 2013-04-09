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

class ThreadUpvote < ActiveRecord::Base
  attr_accessible :submission_id, :user_id

  belongs_to :submission
  belongs_to :user
end
