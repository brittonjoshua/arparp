class Vote < ActiveRecord::Base
  belongs_to :voter_id, class_name: :User
  belongs_to :votable, polymorphic: true

  def total_votes
    self.inject(0) { |sum, vote| sum += vote.value }
  end
end
