class CommentAncestor < ActiveRecord::Base
  attr_accessible :ancestor_id, :comment_id, :descendant_id
end
