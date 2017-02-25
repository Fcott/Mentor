class UserJob < ApplicationRecord
  validates :job_category_id, uniqueness: {scope: :user_id}
  belongs_to :user
  belongs_to :job_category

  def self.users_of(job_ids)
    where(job_category: job_ids).map(&:user)
  end

end
