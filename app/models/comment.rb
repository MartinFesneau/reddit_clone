class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, optionnal: true, class_name: "Comment"

  def comments
    Comment.where(commentable: commentable, parent_id: id)
  end
end
