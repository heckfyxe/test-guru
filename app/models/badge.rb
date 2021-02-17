class Badge < ApplicationRecord
  BADGES_TYPES = %i[first_time category level].freeze

  validates :title, presence: true
  validates :image_url, presence: true
  enum badge_type: BADGES_TYPES

  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges
end
