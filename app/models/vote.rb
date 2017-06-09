class Vote < ActiveRecord::Base
  include Votable
  belongs_to :voter, class_name: :User
  belongs_to :votable, polymorphic: true

  validates :voter, uniqueness: { scope: :votable }
end
