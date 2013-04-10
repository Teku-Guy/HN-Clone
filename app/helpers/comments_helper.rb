module CommentsHelper

  #NOTE TO SELF. THIS IS AN N+1 QUERY. FIND A WAY TO NOT N+! THIS.!!!!!!!!
  def make_tree(submission_id) #REV: Glad to see you're pushing yourself
    tree = []

    comments = Submission.find(submission_id).comment_ids

    comments.each do |comment_id|
      branch = CommentAncestor.where(:ancestor_id => comment_id)
      tree << branch #REV: this would return only one layer, right?
    end
    tree
  end
end
