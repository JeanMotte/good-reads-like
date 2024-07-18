class Author < ApplicationRecord
  has_many :books

  vaidates :first_name, :last_name, :biography, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
end
