class Gallery < ApplicationRecord
  has_many_attached :attachments
  validates :name, presence: true
  validates :description, presence: true
end
