class UserJob < ApplicationRecord
  validates :job_category_id, uniqueness: scope: :user_id
  belongs_to :user
  belongs_to :job_category

end
