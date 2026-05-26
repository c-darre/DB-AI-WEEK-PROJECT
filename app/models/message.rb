class Message < ApplicationRecord
  belongs_to :chat

  has_one_attached :photo

  scope :recommendations, -> { where(role: "assistant").where.not(image_url: nil) }
end
