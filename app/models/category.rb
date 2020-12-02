class Category < ApplicationRecord
  has_one :test, dependent: :nullify
end
