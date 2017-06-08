class Vote < ActiveRecord::Base
  belongs_to :voter_id, class_name: :User
  belongs_to :votable, polymorphic: true
end
