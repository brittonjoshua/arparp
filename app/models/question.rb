class Question < ActiveRecord::Base
  include Votable

  belongs_to  :creator, class_name: "User"
  has_many  :answers
  has_one  :best_answer, class_name: "Answer"
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates  :title, :text, :creator_id, presence: true
end
