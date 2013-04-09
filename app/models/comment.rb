# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  body          :text
#  author_id     :integer
#  parent_id     :integer
#  submission_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :body, :author_id, :parent_id, :submission_id

  belongs_to :author, :class_name => "User", :foreign_key => :author_id
  belongs_to :parent, :class_name => "Comment", :foreign_key => :parent_id
  belongs_to :submission
end
