class Comment < ActiveRecord::Base
  include Voteable

  belongs_to :user
  belongs_to :post
  has_many :votes, as: :voteable

  validates :content, presence: true, length: {minimum: 5}

end
