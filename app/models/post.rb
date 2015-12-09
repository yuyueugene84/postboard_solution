class Post < ActiveRecord::Base
  has_many :comments
  has_many :categories_posts
  has_many :categories, through: :categories_posts
end