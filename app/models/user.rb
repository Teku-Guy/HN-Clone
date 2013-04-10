# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  password   :string(255)
#  karma      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :username, :password, :karma, :emails_attributes

  has_many :submissions
  has_many :comments
  has_many :thread_upvotes

  has_many :emails
  accepts_nested_attributes_for :emails, :reject_if => :all_blank

  validates :username, :presence => true, :uniqueness => true

  def add_karma
    self.karma += 1
    self.save
  end

  def remove_karma
    self.karma -= 1
    self.save
  end
end
