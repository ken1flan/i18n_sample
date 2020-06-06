class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 10000 }
  validate :title_must_contain_cat

  enum status: { drafted: 0, published: 1 }

  def title_must_contain_cat
    return true if title.blank?
    pattern = I18n.t('validation.article.title_must_contain_cat.condition').join('|')
    regexp = Regexp.new(pattern)
    errors.add(:title, :title_must_contain_cat) unless regexp.match?(title)
  end
end
