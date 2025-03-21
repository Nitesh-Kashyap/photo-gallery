class Gallery < ApplicationRecord
  belongs_to :restaurant
  has_many_attached :attachments
  validates :name, :description, presence: true
end
