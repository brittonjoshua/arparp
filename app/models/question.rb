class Question < ActiveRecord::Base
  include Voteable
  belongs_to  :creator, class_name: "User"
  has_many  :answers
  has_one  :best_answer, class_name: "Answer"
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates  :title, :text, :creator_id, presence: true
end
