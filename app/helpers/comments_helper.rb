module CommentsHelper

  def make_tree(submission_id)
    tree = []

    comments = Submission.find(submission_id).comment_ids

    comments.each do |comment_id|
      branch = CommentAncestor.where(:ancestor_id => comment_id)
      tree << branch
    end

  end
end
