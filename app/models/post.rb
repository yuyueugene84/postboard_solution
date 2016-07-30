class Post < ActiveRecord::Base
  include Voteable

  belongs_to :user

  has_many :comments
  has_many :categories_posts
  has_many :categories, through: :categories_posts
  has_many :votes, as: :voteable

end
