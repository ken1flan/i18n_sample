class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 10000 }

  enum status: { drafted: 0, published: 1 }
end
