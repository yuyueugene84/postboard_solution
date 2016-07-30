module Voteable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable #when this module is being included, execute this code
  end

  def total_votes
    up_votes - down_votes
  end

  def up_votes
    self.votes.where(vote: true).size
  end

  def down_votes
    self.votes.where(vote: false).size
  end
end
