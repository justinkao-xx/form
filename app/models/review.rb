class Review < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :heading, presence: true, length: {maximum: 60}
  validates :content, presence: true, length: {maximum: 2000}
  validates :user_id, presence: true
end
