class Book < ApplicationRecord
  belongs_to :author
  validates :name, :author, :publishDate, presence: true
  validate :publish_date

  private

  def publish_date
    if author.present? && author.birthDate > publishDate
      errors.add(:model_years, 'Invalid publish date')
    end
  end
end
