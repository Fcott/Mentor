class JobCategory < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  validates :name, uniqueness: { case_sensitive: false }

  has_many :subcategories, class_name: JobCategory, foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent_category, class_name: JobCategory

  def to_be_unique_category
    self.name.strip
  end
end
