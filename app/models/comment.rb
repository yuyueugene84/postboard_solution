class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :votes, as: :voteable

  validates :content, presence: true, length: {minimum: 5}

  def up_votes
    votes.where(vote: true).length
  end

  def down_vote
    votes.where(vote: false).length
  end

  def total_votes
    up_votes - down_vote
  end
end