class Restaurant < ApplicationRecord
  has_one :menu, dependent: :destroy
  has_many :galleries, dependent: :destroy
end
