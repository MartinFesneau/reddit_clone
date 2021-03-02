class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, optional: true, class_name: "Comment"
  def comments
    Comment.where(commentable: commentable, parent_id: id)
  end
  
  def destroy
    update(user: nil, body: nil)
  end

  def deleted?
    user.nil?
  end

  # CODE TO MOVE UP ALL COMMENTS IF A COMMENT IS DELETED
  # # return all the comment attached to a comment
  # def child_comment
  #   Comment.where(parent_id: self)
  # end
  
  # before_destroy :handle_children

  # # once the parent comment of a comment is deleted
  # # move up all the related comments
  # def handle_children
  #   child_comment.update_all(parent_id: parent_id)
  # end

end
