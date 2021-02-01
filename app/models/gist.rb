class Gist < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :question
  belongs_to :user
end
