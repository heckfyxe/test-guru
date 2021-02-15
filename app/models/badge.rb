class Badge < ApplicationRecord
  BADGES_TYPES = %w[first_time? category? level?].freeze

  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges
end
