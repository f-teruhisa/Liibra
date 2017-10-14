class Like < ActiveRecord::Base
  belongs_to :theme, counter_cache: :likes_count
  belongs_to :user
end
