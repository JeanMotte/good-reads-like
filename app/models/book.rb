class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :reviews
  has_many :likes

  validates :author, presence: true, uniqueness: { scope: :title }
  validates :category, presence: true, allow_blank: false
  validates :published_date, :number_of_pages, presence: true, allow_blank: false
end
