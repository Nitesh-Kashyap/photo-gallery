class Restaurant < ApplicationRecord
  has_many :galleries, dependent: :destroy
end
