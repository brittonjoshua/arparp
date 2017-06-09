class Comment < ActiveRecord::Base
  include Voteable
  belongs_to :commentor, class_name: "User"
  belongs_to :commentable, polymorphic: true
  has_many  :votes, as: :votable

  validates :text, :commentor_id, presence: true
end
