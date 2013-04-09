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

class Submission < ActiveRecord::Base
  attr_accessible :url, :title, :description, :user_id

  has_many :comments
  has_many :thread_upvotes
  belongs_to :user
end
