class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :votes, as: :voteable

  validates :content, presence: true, length: {minimum: 5}

  def up_votes
    self.votes.where(vote: true).length
  end

  def down_votes
    self.votes.where(vote: false).length
  end

  def total_votes
    up_votes - down_votes
  end
end
