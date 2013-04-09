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
  attr_accessible :url, :title, :description, :user_id, :comments_attributes

  has_many :comments
  accepts_nested_attributes_for :comments, :reject_if => :all_blank

  has_many :thread_upvotes
  belongs_to :user

  def total_upvotes
    ThreadUpvote.where("submission_id = ?", self.id).count
  end

  def upvote(user_id)
    ThreadUpvote.create!(:submission_id => self.id, :user_id => user_id)
  end

  def remove_upvote(user_id)
    ThreadUpvote.where(:submission_id => self.id, :user_id => user_id)[0].destroy
  end

  def user_voted?(user_id)
    ThreadUpvote.where(:submission_id => self.id, :user_id => user_id).exists?
  end
end

