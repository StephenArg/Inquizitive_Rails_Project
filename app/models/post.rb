class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :description, :image_url, presence: true
  validates :image_url, format: {with: /\.(png|jpg)\Z/i}
  validates :title, :length => {in: 3..350}
end
