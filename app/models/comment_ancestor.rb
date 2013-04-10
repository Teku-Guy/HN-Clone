class CommentAncestor < ActiveRecord::Base
  attr_accessible :ancestor_id, :descendant_id
end
