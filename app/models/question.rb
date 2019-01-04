class Question < ApplicationRecord
  validates :question, :answer, :image_url, :subject, :topic, presence: true
  validates :image_url, format: {with: /\.(png|jpg)\Z/i}
end
