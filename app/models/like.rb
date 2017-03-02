class Like < ApplicationRecord
  belongs_to :user
  belongs_to :story, counter_cache: :likes_count
end
