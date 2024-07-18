class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  AUTHORIZED_RATINGS = (1..5)

  validates :comment, presence: true
  validates :rating, inclusion: { in: AUTHORIZED_RATINGS }

end
