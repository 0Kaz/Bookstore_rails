class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  belongs_to :publisher

  validates :title, presence: true
  validates :isbn, presence: true

end
