class ChangeCommentAncestory < ActiveRecord::Migration
  def change
    remove_column :comment_ancestors, :comment_id
  end
end
