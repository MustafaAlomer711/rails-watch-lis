class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, :overview, uniqueness: true
end
