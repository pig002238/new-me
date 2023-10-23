class Post < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  has_one_attached :image
  
  validates :content, presence: true
end
