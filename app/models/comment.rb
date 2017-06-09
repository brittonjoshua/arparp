class Comment < ActiveRecord::Base
  include Votable

  belongs_to :commentor, class_name: "User"
  belongs_to :commentable, polymorphic: true

  validates :text, :commentor_id, presence: true
end
