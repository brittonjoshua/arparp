class Comment < ActiveRecord::Base
  # Remember to create a migration!
  include Voteable

  belongs_to :commentator, class_name: "User"
  belongs_to :commentable, polymorphic: true

  validates :text, :commentator_id, presence: true
end
