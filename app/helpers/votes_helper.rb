module Voteable
  def total_votes
    self.votes.inject(0) { |sum, vote| sum += vote.value }
  end
end



