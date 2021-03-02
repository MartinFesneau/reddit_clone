module CommentsHelper
  def reply_to_comment_id(comment, nesting, max_nesting)
    # use the comment as the parent if we allow allow unlimited nesting
    # or if it is inside the allowed nesting
    if max_nesting.blank? || nesting < max_nesting
      comment.id
    else
      # otherwise use the parent comment
      # and use the comment as the "sibling"
      comment.parent_id
    end
  end

end