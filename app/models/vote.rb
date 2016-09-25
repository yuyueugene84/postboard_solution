class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :creator, foreign_key: :user_id, class_name: "User"

  #validates_uniqueness_of :creator, scope: [:voteable_type, :voteable_id]
end
