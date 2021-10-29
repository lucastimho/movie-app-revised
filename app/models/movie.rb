class Movie < ApplicationRecord
  validates :title, :plot, :director, length: {minimum: 2}
  validates :year, length: {maximum: 4}
  has_many :actors
  has_many :movie_genres
  has_many :genres, through: :movie_genres
end
