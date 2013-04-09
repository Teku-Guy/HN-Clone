class CreateCommentAncestors < ActiveRecord::Migration
  def change
    create_table :comment_ancestors do |t|
      t.integer :ancestor_id
      t.integer :comment_id
      t.integer :descendant_id
      t.timestamps
    end
  end
end
