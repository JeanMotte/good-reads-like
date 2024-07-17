class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :reviews
  has_many :likes
end
